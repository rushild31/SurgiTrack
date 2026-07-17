import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About SurgiTrack")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const CircleAvatar(
              radius: 45,
              child: Icon(Icons.local_hospital, size: 45),
            ),

            const SizedBox(height: 20),

            const Text(
              "SurgiTrack",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              "Cardiothoracic Surgery Training Portfolio",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            _sectionCard(
              "Purpose",
              "A personal surgical portfolio designed to document operative "
                  "experience, competency growth and residency progress.",
            ),

            const SizedBox(height: 16),

            _sectionCard(
              "Vision",
              "To create a lifelong surgical training companion for residents "
                  "and surgeons.",
            ),

            const SizedBox(height: 16),

            _sectionCard(
              "Technology",
              "Flutter application\n"
                  "Local-first architecture\n"
                  "Future Supabase cloud synchronization",
            ),

            const SizedBox(height: 16),

            _sectionCard(
              "Built For",
              "Cardiothoracic and Vascular Surgery trainees maintaining a "
                  "structured operative portfolio.",
            ),

            const SizedBox(height: 30),

            const Text("Version 1.0.0 MVP", style: TextStyle(fontSize: 14)),

            const SizedBox(height: 8),

            const Text("© SurgiTrack", style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard(String title, String text) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(text),
          ],
        ),
      ),
    );
  }
}
