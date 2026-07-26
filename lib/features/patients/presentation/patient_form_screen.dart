import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';
import 'package:surgitrack/features/patients/providers/patient_provider.dart';

class PatientFormScreen extends ConsumerStatefulWidget {
  final Patient? patient;

  const PatientFormScreen({super.key, this.patient});

  @override
  ConsumerState<PatientFormScreen> createState() => _PatientFormScreenState();
}

class _PatientFormScreenState extends ConsumerState<PatientFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController hospitalIdController;
  late final TextEditingController efController;
  late final TextEditingController addressController;
  late final TextEditingController pastHistoryController;

  DateTime? dob;
  DateTime? admissionDate;

  String? bloodGroup;

  String sex = 'Male';

  bool _isSaving = false;

  final List<String> selectedComorbidities = [];

  final List<String> availableComorbidities = [
    'Hypertension',
    'Diabetes Mellitus',
    'CAD',
    'COPD',
    'CKD',
    'Stroke',
    'PVD',
    'Smoking',
    'Alcohol',
    'Others',
  ];

  bool get isEditing => widget.patient != null;

  @override
  void initState() {
    super.initState();

    final patient = widget.patient;

    nameController = TextEditingController(text: patient?.name ?? '');

    hospitalIdController = TextEditingController(
      text: patient?.hospitalId ?? '',
    );

    efController = TextEditingController(
      text: patient?.ejectionFraction?.toString() ?? '',
    );

    addressController = TextEditingController(text: patient?.address ?? '');

    pastHistoryController = TextEditingController(
      text: patient?.pastOperativeHistory ?? '',
    );

    dob = patient?.dateOfBirth;
    admissionDate = patient?.admissionDate;
    bloodGroup = patient?.bloodGroup;
    sex = patient?.sex ?? 'Male';

    selectedComorbidities.addAll(patient?.comorbidities ?? []);
  }

  @override
  void dispose() {
    nameController.dispose();
    hospitalIdController.dispose();
    efController.dispose();
    addressController.dispose();
    pastHistoryController.dispose();

    super.dispose();
  }

  Future<void> _pickDate({required bool isDob}) async {
    final now = DateTime.now();

    final existingDate = isDob ? dob : admissionDate;

    final selected = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: now,
      initialDate: existingDate ?? now,
    );

    if (selected == null || !mounted) {
      return;
    }

    setState(() {
      if (isDob) {
        dob = selected;
      } else {
        admissionDate = selected;
      }
    });
  }

  Future<void> _savePatient() async {
    if (_isSaving) {
      return;
    }

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (dob == null) {
      _showMessage('Please select the patient date of birth.');
      return;
    }

    final now = DateTime.now();

    final patient = Patient(
      id: widget.patient?.id,
      patientId:
          widget.patient?.patientId ?? now.millisecondsSinceEpoch.toString(),
      name: nameController.text.trim(),
      hospitalId: hospitalIdController.text.trim(),
      dateOfBirth: dob!,
      sex: sex,
      bloodGroup: bloodGroup,
      comorbidities: List.unmodifiable(selectedComorbidities),
      address: _nullableText(addressController.text),
      admissionDate: admissionDate,
      ejectionFraction: double.tryParse(efController.text.trim()),
      pastOperativeHistory: _nullableText(pastHistoryController.text),
      createdAt: widget.patient?.createdAt ?? now,
      updatedAt: now,
    );

    setState(() {
      _isSaving = true;
    });

    try {
      final repository = ref.read(patientRepositoryProvider);

      if (isEditing) {
        await repository.updatePatient(patient);
      } else {
        await repository.addPatient(patient);
      }

      ref.invalidate(patientListProvider);

      if (!mounted) {
        return;
      }

      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) {
        return;
      }

      _showMessage('Unable to save patient. Please try again.');
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  String? _nullableText(String value) {
    final trimmed = value.trim();

    return trimmed.isEmpty ? null : trimmed;
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Patient' : 'Add Patient')),
      body: Form(
        key: _formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 900;

            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 32 : 16,
                vertical: 24,
              ),
              children: [
                _FormIntro(isEditing: isEditing),

                const SizedBox(height: 24),

                _FormSection(
                  title: 'Patient Identity',
                  icon: Icons.person_outline,
                  children: [
                    TextFormField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Patient Name',
                        hintText: 'Enter full name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter patient name';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: hospitalIdController,
                      decoration: const InputDecoration(
                        labelText: 'Hospital ID / MRD',
                        hintText: 'Enter hospital identifier',
                        prefixIcon: Icon(Icons.badge_outlined),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _FormSection(
                  title: 'Demographics',
                  icon: Icons.person_search_outlined,
                  children: [
                    _DateField(
                      label: 'Date of Birth',
                      value: dob == null ? null : _formatDate(dob!),
                      icon: Icons.cake_outlined,
                      onTap: () => _pickDate(isDob: true),
                    ),

                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      initialValue: sex,
                      decoration: const InputDecoration(
                        labelText: 'Sex',
                        prefixIcon: Icon(Icons.wc_outlined),
                      ),
                      items: const [
                        DropdownMenuItem(value: 'Male', child: Text('Male')),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female'),
                        ),
                        DropdownMenuItem(value: 'Other', child: Text('Other')),
                      ],
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }

                        setState(() {
                          sex = value;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      initialValue: bloodGroup,
                      decoration: const InputDecoration(
                        labelText: 'Blood Group',
                        prefixIcon: Icon(Icons.bloodtype_outlined),
                      ),
                      items:
                          const [
                                'A+',
                                'A-',
                                'B+',
                                'B-',
                                'AB+',
                                'AB-',
                                'O+',
                                'O-',
                                'Unknown',
                              ]
                              .map(
                                (group) => DropdownMenuItem(
                                  value: group,
                                  child: Text(group),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          bloodGroup = value;
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                _FormSection(
                  title: 'Clinical Information',
                  icon: Icons.medical_information_outlined,
                  children: [
                    const Text(
                      'Comorbidities',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: availableComorbidities.map((item) {
                        return FilterChip(
                          label: Text(item),
                          selected: selectedComorbidities.contains(item),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                if (!selectedComorbidities.contains(item)) {
                                  selectedComorbidities.add(item);
                                }
                              } else {
                                selectedComorbidities.remove(item);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: efController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Ejection Fraction',
                        hintText: 'Example: 55',
                        suffixText: '%',
                        prefixIcon: Icon(Icons.favorite_border),
                      ),
                      validator: (value) {
                        final text = value?.trim() ?? '';

                        if (text.isEmpty) {
                          return null;
                        }

                        final ef = double.tryParse(text);

                        if (ef == null) {
                          return 'Enter a valid number';
                        }

                        if (ef < 0 || ef > 100) {
                          return 'Enter a value between 0 and 100';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: addressController,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        prefixIcon: Icon(Icons.location_on_outlined),
                        alignLabelWithHint: true,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _DateField(
                      label: 'Admission Date',
                      value: admissionDate == null
                          ? null
                          : _formatDate(admissionDate!),
                      icon: Icons.event_outlined,
                      onTap: () => _pickDate(isDob: false),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: pastHistoryController,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Past Operative History',
                        hintText: 'Add relevant previous operations',
                        prefixIcon: Icon(Icons.history_outlined),
                        alignLabelWithHint: true,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                SizedBox(
                  height: 52,
                  child: FilledButton.icon(
                    onPressed: _isSaving ? null : _savePatient,
                    icon: _isSaving
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            isEditing
                                ? Icons.save_outlined
                                : Icons.person_add_outlined,
                          ),
                    label: Text(
                      _isSaving
                          ? 'Saving...'
                          : isEditing
                          ? 'Update Patient'
                          : 'Save Patient',
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FormIntro extends StatelessWidget {
  final bool isEditing;

  const _FormIntro({required this.isEditing});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEditing ? 'Update patient information' : 'Create a patient record',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          isEditing
              ? 'Review and update the patient details below.'
              : 'Add the patient details required for your surgical logbook.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _FormSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _FormSection({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final String? value;
  final IconData icon;
  final VoidCallback onTap;

  const _DateField({
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          suffixIcon: const Icon(Icons.calendar_today_outlined),
        ),
        child: Text(
          value ?? 'Select date',
          style: TextStyle(
            color: value == null
                ? Theme.of(context).colorScheme.onSurfaceVariant
                : null,
          ),
        ),
      ),
    );
  }
}
