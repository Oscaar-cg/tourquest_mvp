// Home Page of the MVP.
// Shows XP + two main buttons: Explore / Progress.

import 'package:flutter/material.dart';
import '../storage/hive_storage.dart';
import 'challenge_list_page.dart';
import 'progress_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = HiveStorage.loadProgress(); // Load XP + completed list

    return Scaffold(
      appBar: AppBar(
        title: const Text("TourQuest – Cedar City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "XP: ${progress.xp}",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),

            // Button to explore challenges
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ChallengeListPage(),
                  ),
                );
              },
              child: const Text("Start Exploring"),
            ),
            const SizedBox(height: 10),

            // Button to show user progress
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProgressPage(),
                  ),
                );
              },
              child: const Text("My Progress"),
            ),
          ],
        ),
      ),
    );
  }
}