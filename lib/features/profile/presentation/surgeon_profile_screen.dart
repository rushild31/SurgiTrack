import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:surgitrack/features/profile/domain/surgeon_profile.dart';
import 'package:surgitrack/features/profile/providers/surgeon_profile_provider.dart';

class SurgeonProfileScreen extends ConsumerStatefulWidget {
  const SurgeonProfileScreen({super.key});

  @override
  ConsumerState<SurgeonProfileScreen> createState() =>
      _SurgeonProfileScreenState();
}

class _SurgeonProfileScreenState extends ConsumerState<SurgeonProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final qualificationController = TextEditingController();

  final specialtyController = TextEditingController();

  final trainingProgramController = TextEditingController();

  final trainingYearController = TextEditingController();

  final institutionController = TextEditingController();

  final registrationNumberController = TextEditingController();

  final membershipsController = TextEditingController();

  DateTime? residencyStartDate;

  bool loaded = false;

  @override
  void dispose() {
    nameController.dispose();

    emailController.dispose();

    phoneController.dispose();

    qualificationController.dispose();

    specialtyController.dispose();

    trainingProgramController.dispose();

    trainingYearController.dispose();

    institutionController.dispose();

    registrationNumberController.dispose();

    membershipsController.dispose();

    super.dispose();
  }

  void populateProfile(SurgeonProfile profile) {
    if (loaded) return;

    loaded = true;

    nameController.text = profile.name;

    emailController.text = profile.email ?? "";

    phoneController.text = profile.phone ?? "";

    qualificationController.text = profile.qualification ?? "";

    specialtyController.text = profile.specialty ?? "";

    trainingProgramController.text = profile.department ?? "";

    trainingYearController.text = profile.trainingYear ?? "";

    institutionController.text = profile.institution ?? "";

    registrationNumberController.text = profile.registrationNumber ?? "";

    membershipsController.text = profile.memberships ?? "";

    residencyStartDate = profile.residencyStartDate;
  }

  Future<void> saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final now = DateTime.now();

    final profile = SurgeonProfile(
      name: nameController.text.trim(),

      email: emailController.text.trim().isEmpty
          ? null
          : emailController.text.trim(),

      phone: phoneController.text.trim().isEmpty
          ? null
          : phoneController.text.trim(),

      qualification: qualificationController.text.trim().isEmpty
          ? null
          : qualificationController.text.trim(),

      specialty: specialtyController.text.trim().isEmpty
          ? null
          : specialtyController.text.trim(),

      department: trainingProgramController.text.trim().isEmpty
          ? null
          : trainingProgramController.text.trim(),

      trainingYear: trainingYearController.text.trim().isEmpty
          ? null
          : trainingYearController.text.trim(),

      institution: institutionController.text.trim().isEmpty
          ? null
          : institutionController.text.trim(),

      registrationNumber: registrationNumberController.text.trim().isEmpty
          ? null
          : registrationNumberController.text.trim(),

      memberships: membershipsController.text.trim().isEmpty
          ? null
          : membershipsController.text.trim(),

      residencyStartDate: residencyStartDate,

      createdAt: now,

      updatedAt: now,
    );

    final repository = ref.read(surgeonProfileRepositoryProvider);

    await repository.saveProfile(profile);

    ref.invalidate(surgeonProfileProvider);

    if (!mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Profile saved")));
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,

      initialDate: residencyStartDate ?? DateTime.now(),

      firstDate: DateTime(2000),

      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        residencyStartDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(surgeonProfileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Surgeon Profile")),

      body: profile.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, _) => Center(child: Text(error.toString())),

        data: (existingProfile) {
          if (existingProfile != null) {
            populateProfile(existingProfile);
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 45,

                      child: const Icon(Icons.person, size: 45),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Personal Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  TextFormField(
                    controller: nameController,

                    decoration: const InputDecoration(
                      labelText: "Surgeon Name",
                    ),

                    validator: (value) =>
                        value == null || value.isEmpty ? "Required" : null,
                  ),

                  TextFormField(
                    controller: qualificationController,

                    decoration: const InputDecoration(
                      labelText: "Qualification",
                      hintText: "Example: MS General Surgery",
                    ),
                  ),

                  TextFormField(
                    controller: specialtyController,

                    decoration: const InputDecoration(
                      labelText: "Specialty",
                      hintText: "Example: CTVS",
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Training Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  TextFormField(
                    controller: trainingProgramController,

                    decoration: const InputDecoration(
                      labelText: "Training Program",
                      hintText: "Example: MCh CTVS",
                    ),
                  ),

                  TextFormField(
                    controller: trainingYearController,

                    decoration: const InputDecoration(
                      labelText: "Training Year",
                      hintText: "Example: 2026-2029",
                    ),
                  ),

                  TextFormField(
                    controller: institutionController,

                    decoration: const InputDecoration(
                      labelText: "Institute / Hospital",
                    ),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,

                    title: const Text("Residency Start Date"),

                    subtitle: Text(
                      residencyStartDate == null
                          ? "Select date"
                          : "${residencyStartDate!.day}/"
                                "${residencyStartDate!.month}/"
                                "${residencyStartDate!.year}",
                    ),

                    trailing: const Icon(Icons.calendar_month),

                    onTap: pickDate,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Professional Credentials",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  TextFormField(
                    controller: registrationNumberController,

                    decoration: const InputDecoration(
                      labelText: "Medical Registration Number",
                    ),
                  ),

                  TextFormField(
                    controller: membershipsController,

                    decoration: const InputDecoration(
                      labelText: "Professional Memberships",
                      hintText: "Example: IACTS, ISMICS",
                    ),

                    maxLines: 2,
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Contact Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  TextFormField(
                    controller: emailController,

                    decoration: const InputDecoration(labelText: "Email ID"),
                  ),

                  TextFormField(
                    controller: phoneController,

                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                    ),

                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,

                    child: ElevatedButton(
                      onPressed: saveProfile,

                      child: const Text("SAVE PROFILE"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
