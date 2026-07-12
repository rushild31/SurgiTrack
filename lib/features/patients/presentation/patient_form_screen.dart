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

  late TextEditingController nameController;
  late TextEditingController hospitalIdController;
  late TextEditingController efController;
  late TextEditingController addressController;
  late TextEditingController pastHistoryController;

  DateTime? dob;
  DateTime? admissionDate;

  String? bloodGroup;

  final List<String> selectedComorbidities = [];

  final List<String> availableComorbidities = [
    "Hypertension",
    "Diabetes Mellitus",
    "CAD",
    "COPD",
    "CKD",
    "Stroke",
    "PVD",
    "Smoking",
    "Alcohol",
    "Others",
  ];

  bool get isEditing => widget.patient != null;

  @override
  void initState() {
    super.initState();

    final patient = widget.patient;

    nameController = TextEditingController(text: patient?.name ?? "");

    hospitalIdController = TextEditingController(
      text: patient?.hospitalId ?? "",
    );

    efController = TextEditingController(
      text: patient?.ejectionFraction?.toString() ?? "",
    );

    addressController = TextEditingController(text: patient?.address ?? "");

    pastHistoryController = TextEditingController(
      text: patient?.pastOperativeHistory ?? "",
    );

    dob = patient?.dateOfBirth;

    admissionDate = patient?.admissionDate;

    bloodGroup = patient?.bloodGroup;

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

  Future<void> pickDate(bool isDob) async {
    final selected = await showDatePicker(
      context: context,

      firstDate: DateTime(1900),

      lastDate: DateTime.now(),

      initialDate: DateTime.now(),
    );

    if (selected == null) return;

    setState(() {
      if (isDob) {
        dob = selected;
      } else {
        admissionDate = selected;
      }
    });
  }

  Future<void> savePatient() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (dob == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select date of birth")),
      );

      return;
    }

    final now = DateTime.now();

    final patient = Patient(
      id: widget.patient?.id,

      patientId:
          widget.patient?.patientId ??
          DateTime.now().millisecondsSinceEpoch.toString(),

      name: nameController.text.trim(),

      hospitalId: hospitalIdController.text.trim(),

      dateOfBirth: dob!,

      bloodGroup: bloodGroup,

      comorbidities: selectedComorbidities,

      address: addressController.text.trim(),

      admissionDate: admissionDate,

      ejectionFraction: double.tryParse(efController.text.trim()),

      pastOperativeHistory: pastHistoryController.text.trim(),

      createdAt: widget.patient?.createdAt ?? now,

      updatedAt: now,
    );

    final repository = ref.read(patientRepositoryProvider);

    if (isEditing) {
      await repository.updatePatient(patient);
    } else {
      await repository.addPatient(patient);
    }

    ref.invalidate(patientListProvider);

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? "Edit Patient" : "Add Patient")),

      body: Form(
        key: _formKey,

        child: ListView(
          padding: const EdgeInsets.all(16),

          children: [
            TextFormField(
              controller: nameController,

              decoration: const InputDecoration(labelText: "Patient Name"),

              validator: (v) => v!.isEmpty ? "Enter patient name" : null,
            ),

            TextFormField(
              controller: hospitalIdController,

              decoration: const InputDecoration(labelText: "Hospital ID / MRD"),
            ),

            ListTile(
              title: Text(
                dob == null
                    ? "Select DOB"
                    : "${dob!.day}-${dob!.month}-${dob!.year}",
              ),

              trailing: const Icon(Icons.calendar_today),

              onTap: () => pickDate(true),
            ),

            DropdownButtonFormField<String>(
              initialValue: bloodGroup,

              decoration: const InputDecoration(labelText: "Blood Group"),

              items: [
                "A+",
                "A-",
                "B+",
                "B-",
                "AB+",
                "AB-",
                "O+",
                "O-",
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),

              onChanged: (v) {
                setState(() {
                  bloodGroup = v;
                });
              },
            ),

            const SizedBox(height: 12),

            const Text(
              "Comorbidities",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Wrap(
              spacing: 8,

              children: availableComorbidities.map((item) {
                return FilterChip(
                  label: Text(item),

                  selected: selectedComorbidities.contains(item),

                  onSelected: (selected) {
                    setState(() {
                      selected
                          ? selectedComorbidities.add(item)
                          : selectedComorbidities.remove(item);
                    });
                  },
                );
              }).toList(),
            ),

            TextFormField(
              controller: efController,

              keyboardType: TextInputType.number,

              decoration: const InputDecoration(labelText: "EF (%)"),
            ),

            TextFormField(
              controller: addressController,

              decoration: const InputDecoration(labelText: "Address"),
            ),

            ListTile(
              title: Text(
                admissionDate == null
                    ? "Select Admission Date"
                    : "${admissionDate!.day}-${admissionDate!.month}-${admissionDate!.year}",
              ),

              onTap: () => pickDate(false),
            ),

            TextFormField(
              controller: pastHistoryController,

              maxLines: 3,

              decoration: const InputDecoration(
                labelText: "Past Operative History",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: savePatient,

              child: Text(isEditing ? "Update Patient" : "Save Patient"),
            ),
          ],
        ),
      ),
    );
  }
}
