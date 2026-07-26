import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

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

  final ImagePicker _imagePicker = ImagePicker();

  DateTime? residencyStartDate;
  DateTime? residencyEndDate;

  String? profilePhotoPath;

  SurgeonProfile? existingProfile;

  bool loaded = false;
  bool saving = false;

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
    existingProfile = profile;

    nameController.text = profile.name;
    emailController.text = profile.email ?? '';
    phoneController.text = profile.phone ?? '';
    qualificationController.text = profile.qualification ?? '';
    specialtyController.text = profile.specialty ?? '';
    trainingProgramController.text = profile.department ?? '';
    trainingYearController.text = profile.trainingYear ?? '';
    institutionController.text = profile.institution ?? '';
    registrationNumberController.text = profile.registrationNumber ?? '';
    membershipsController.text = profile.memberships ?? '';

    residencyStartDate = profile.residencyStartDate;
    residencyEndDate = profile.residencyEndDate;
    profilePhotoPath = profile.profilePhotoPath;
  }

  Future<void> pickProfilePhoto() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );

    if (source == null) return;

    try {
      final pickedImage = await _imagePicker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1200,
      );

      if (pickedImage == null || !mounted) return;

      setState(() {
        profilePhotoPath = pickedImage.path;
      });
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unable to select profile photo: $error')),
      );
    }
  }

  void removeProfilePhoto() {
    setState(() {
      profilePhotoPath = null;
    });
  }

  Future<void> saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      saving = true;
    });

    try {
      final currentProfile = await ref.read(surgeonProfileProvider.future);

      final now = DateTime.now();

      final profile = SurgeonProfile(
        id: currentProfile?.id,

        name: nameController.text.trim(),

        email: _nullableValue(emailController.text),

        phone: _nullableValue(phoneController.text),

        profilePhotoPath: profilePhotoPath,

        qualification: _nullableValue(qualificationController.text),

        specialty: _nullableValue(specialtyController.text),

        department: _nullableValue(trainingProgramController.text),

        institution: _nullableValue(institutionController.text),

        trainingYear: _nullableValue(trainingYearController.text),

        residencyStartDate: residencyStartDate,

        residencyEndDate: residencyEndDate,

        registrationNumber: _nullableValue(registrationNumberController.text),

        memberships: _nullableValue(membershipsController.text),

        createdAt: currentProfile?.createdAt ?? now,

        updatedAt: now,
      );

      final repository = ref.read(surgeonProfileRepositoryProvider);

      await repository.saveProfile(profile);

      ref.invalidate(surgeonProfileProvider);

      if (!mounted) return;

      setState(() {
        existingProfile = profile;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully')),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Unable to save profile: $error')));
    } finally {
      if (mounted) {
        setState(() {
          saving = false;
        });
      }
    }
  }

  String? _nullableValue(String value) {
    final trimmed = value.trim();

    return trimmed.isEmpty ? null : trimmed;
  }

  Future<void> pickDate({required bool isStartDate}) async {
    final currentDate = isStartDate ? residencyStartDate : residencyEndDate;

    final picked = await showDatePicker(
      context: context,

      initialDate: currentDate ?? DateTime.now(),

      firstDate: DateTime(2000),

      lastDate: DateTime.now(),
    );

    if (picked == null || !mounted) return;

    setState(() {
      if (isStartDate) {
        residencyStartDate = picked;
      } else {
        residencyEndDate = picked;
      }
    });
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Not set';
    }

    return '${date.day}/${date.month}/${date.year}';
  }

  Widget buildProfileAvatar() {
    final hasPhoto =
        profilePhotoPath != null &&
        profilePhotoPath!.isNotEmpty &&
        File(profilePhotoPath!).existsSync();

    final theme = Theme.of(context);

    return Stack(
      children: [
        GestureDetector(
          onTap: pickProfilePhoto,

          child: CircleAvatar(
            radius: 52,

            backgroundColor: theme.colorScheme.primaryContainer,

            backgroundImage: hasPhoto
                ? FileImage(File(profilePhotoPath!))
                : null,

            child: hasPhoto
                ? null
                : Icon(
                    Icons.person_outline,
                    size: 52,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
          ),
        ),

        Positioned(
          right: 0,
          bottom: 0,

          child: Material(
            color: theme.colorScheme.primary,

            shape: const CircleBorder(),

            child: InkWell(
              customBorder: const CircleBorder(),

              onTap: pickProfilePhoto,

              child: const Padding(
                padding: EdgeInsets.all(8),

                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        if (hasPhoto)
          Positioned(
            left: 0,
            bottom: 0,

            child: Material(
              color: theme.colorScheme.error,

              shape: const CircleBorder(),

              child: InkWell(
                customBorder: const CircleBorder(),

                onTap: removeProfilePhoto,

                child: const Padding(
                  padding: EdgeInsets.all(6),

                  child: Icon(Icons.close, size: 16, color: Colors.white),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(surgeonProfileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Surgeon Profile')),

      body: profile.when(
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },

        error: (error, _) {
          return _ProfileError(
            message: error.toString(),

            onRetry: () {
              setState(() {
                loaded = false;
                existingProfile = null;
              });

              ref.invalidate(surgeonProfileProvider);
            },
          );
        },

        data: (existingProfileData) {
          if (existingProfileData != null) {
            populateProfile(existingProfileData);
          }

          return Form(
            key: _formKey,

            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),

              children: [
                Center(
                  child: Column(
                    children: [
                      buildProfileAvatar(),

                      const SizedBox(height: 8),

                      Text(
                        'Tap to change profile photo',

                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                const _SectionTitle(
                  title: 'Personal Details',
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: nameController,

                  textCapitalization: TextCapitalization.words,

                  decoration: const InputDecoration(
                    labelText: 'Surgeon Name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: qualificationController,

                  decoration: const InputDecoration(
                    labelText: 'Qualification',
                    hintText: 'Example: MS General Surgery',
                    prefixIcon: Icon(Icons.school_outlined),
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: specialtyController,

                  decoration: const InputDecoration(
                    labelText: 'Specialty',
                    hintText: 'Example: CTVS',
                    prefixIcon: Icon(Icons.medical_services_outlined),
                  ),
                ),

                const SizedBox(height: 28),

                const _SectionTitle(
                  title: 'Training Details',
                  icon: Icons.workspace_premium_outlined,
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: trainingProgramController,

                  decoration: const InputDecoration(
                    labelText: 'Training Program',
                    hintText: 'Example: MCh CTVS',
                    prefixIcon: Icon(Icons.school_outlined),
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: trainingYearController,

                  decoration: const InputDecoration(
                    labelText: 'Training Year',
                    hintText: 'Example: 2026–2029',
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: institutionController,

                  decoration: const InputDecoration(
                    labelText: 'Institute / Hospital',
                    prefixIcon: Icon(Icons.local_hospital_outlined),
                  ),
                ),

                const SizedBox(height: 8),

                _DatePickerTile(
                  title: 'Residency Start Date',

                  value: _formatDate(residencyStartDate),

                  onTap: () {
                    pickDate(isStartDate: true);
                  },
                ),

                _DatePickerTile(
                  title: 'Residency End Date',

                  value: _formatDate(residencyEndDate),

                  onTap: () {
                    pickDate(isStartDate: false);
                  },
                ),

                const SizedBox(height: 28),

                const _SectionTitle(
                  title: 'Professional Credentials',
                  icon: Icons.badge_outlined,
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: registrationNumberController,

                  decoration: const InputDecoration(
                    labelText: 'Medical Registration Number',
                    prefixIcon: Icon(Icons.badge_outlined),
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: membershipsController,

                  maxLines: 2,

                  decoration: const InputDecoration(
                    labelText: 'Professional Memberships',
                    hintText: 'Example: IACTS, ISMICS',
                    prefixIcon: Icon(Icons.groups_outlined),
                  ),
                ),

                const SizedBox(height: 28),

                const _SectionTitle(
                  title: 'Contact Details',
                  icon: Icons.contact_mail_outlined,
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: const InputDecoration(
                    labelText: 'Email ID',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: phoneController,

                  keyboardType: TextInputType.phone,

                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone_outlined),
                  ),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,

                  height: 52,

                  child: FilledButton.icon(
                    onPressed: saving ? null : saveProfile,

                    icon: saving
                        ? const SizedBox(
                            width: 18,
                            height: 18,

                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.save_outlined),

                    label: Text(saving ? 'Saving...' : 'Save Profile'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionTitle({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 21, color: theme.colorScheme.primary),

        const SizedBox(width: 8),

        Text(
          title,

          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _DatePickerTile extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;

  const _DatePickerTile({
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: Icon(
        Icons.calendar_month_outlined,
        color: theme.colorScheme.primary,
      ),

      title: Text(title),

      subtitle: Text(value),

      trailing: const Icon(Icons.chevron_right),

      onTap: onTap,
    );
  }
}

class _ProfileError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ProfileError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            const Icon(Icons.error_outline, size: 48),

            const SizedBox(height: 16),

            const Text(
              'Unable to load profile',

              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(message, textAlign: TextAlign.center),

            const SizedBox(height: 16),

            FilledButton(onPressed: onRetry, child: const Text('Try Again')),
          ],
        ),
      ),
    );
  }
}
