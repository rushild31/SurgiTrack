import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:surgitrack/features/patients/domain/patient.dart';
import 'package:surgitrack/features/patients/providers/patient_provider.dart';

class AddPatientScreen extends ConsumerStatefulWidget {
  const AddPatientScreen({super.key});

  @override
  ConsumerState<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends ConsumerState<AddPatientScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final hospitalIdController = TextEditingController();

  final addressController = TextEditingController();

  final admissionController = TextEditingController();

  final efController = TextEditingController();

  final pastHistoryController = TextEditingController();

  final otherComorbidityController = TextEditingController();

  DateTime? selectedDob;

  String? bloodGroup;

  final List<String> selectedComorbidities = [];

  final List<String> commonComorbidities = [
    'Hypertension',
    'Diabetes Mellitus',
    'Coronary Artery Disease',
    'CKD',
    'COPD',
    'Stroke',
    'Peripheral Vascular Disease',
    'Smoking',
    'Others',
  ];

  @override
  void dispose() {
    nameController.dispose();
    hospitalIdController.dispose();
    addressController.dispose();
    admissionController.dispose();
    efController.dispose();
    pastHistoryController.dispose();
    otherComorbidityController.dispose();

    super.dispose();
  }

  Future<void> pickDob() async {
    final date = await showDatePicker(
      context: context,

      firstDate: DateTime(1900),

      lastDate: DateTime.now(),

      initialDate: DateTime(1970),
    );

    if (date != null) {
      setState(() {
        selectedDob = date;
      });
    }
  }

  Future<void> savePatient() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (selectedDob == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date of birth')),
      );

      return;
    }

    final comorbidities = [...selectedComorbidities];

    if (otherComorbidityController.text.trim().isNotEmpty) {
      comorbidities.add(otherComorbidityController.text.trim());
    }

    final patient = Patient(
      patientId: const Uuid().v4(),

      name: nameController.text.trim(),

      hospitalId: hospitalIdController.text.trim(),

      dateOfBirth: selectedDob!,

      bloodGroup: bloodGroup,

      comorbidities: comorbidities,

      address: addressController.text.trim(),

      admissionDate: DateTime.tryParse(admissionController.text),

      ejectionFraction: double.tryParse(efController.text),

      pastOperativeHistory: pastHistoryController.text.trim(),

      createdAt: DateTime.now(),

      updatedAt: DateTime.now(),
    );

    await ref.read(patientRepositoryProvider).addPatient(patient);

    ref.invalidate(patientListProvider);

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Patient')),

      body: Form(
        key: _formKey,

        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [
            _textField(nameController, 'Patient Name', required: true),

            _textField(
              hospitalIdController,
              'Hospital ID / MRD',
              required: true,
            ),

            ListTile(
              title: Text(
                selectedDob == null
                    ? 'Select DOB'
                    : '${selectedDob!.day}/${selectedDob!.month}/${selectedDob!.year}',
              ),

              trailing: const Icon(Icons.calendar_month),

              onTap: pickDob,
            ),

            if (selectedDob != null)
              Text(
                'Age: ${Patient(patientId: '', name: '', hospitalId: '', dateOfBirth: selectedDob!, createdAt: DateTime.now(), updatedAt: DateTime.now()).age} years',
              ),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Blood Group'),

              initialValue: bloodGroup,

              items: [
                'A+',
                'A-',
                'B+',
                'B-',
                'AB+',
                'AB-',
                'O+',
                'O-',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),

              onChanged: (value) {
                setState(() {
                  bloodGroup = value;
                });
              },
            ),

            _textField(addressController, 'Address'),

            const SizedBox(height: 16),

            const Text(
              'Comorbidities',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Wrap(
              spacing: 8,

              children: commonComorbidities.map((item) {
                return FilterChip(
                  label: Text(item),

                  selected: selectedComorbidities.contains(item),

                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedComorbidities.add(item);
                      } else {
                        selectedComorbidities.remove(item);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            if (selectedComorbidities.contains('Others'))
              _textField(otherComorbidityController, 'Other Comorbidity'),

            _textField(
              efController,
              'Ejection Fraction (%)',
              keyboard: TextInputType.number,
            ),

            _textField(
              pastHistoryController,
              'Past Operative History',
              maxLines: 4,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: savePatient,

              child: const Text('Save Patient'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(
    TextEditingController controller,
    String label, {
    bool required = false,
    TextInputType? keyboard,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: TextFormField(
        controller: controller,

        keyboardType: keyboard,

        maxLines: maxLines,

        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),

        validator: required
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return '$label is required';
                }

                return null;
              }
            : null,
      ),
    );
  }
}
