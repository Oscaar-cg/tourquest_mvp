// Complete Challenge Page
// Very simple for the MVP:
// When the user presses the button, we mark the challenge as done,
// add XP, and save everything in Hive.

import 'package:flutter/material.dart';
import '../models/challenge.dart';
import '../models/user_progress.dart';
import '../storage/hive_storage.dart';

class CompleteChallengePage extends StatelessWidget {
  final Challenge challenge;

  const CompleteChallengePage({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complete Challenge")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Load current progress
            final progress = HiveStorage.loadProgress();

            // If challenge not yet completed, we update it
            if (!progress.completedChallenges.contains(challenge.id)) {
              progress.completedChallenges.add(challenge.id);
              progress.xp += 50;        // XP reward (simple)
              challenge.completed = true;

              // Save everything to Hive
              HiveStorage.saveProgress(progress);
            }

            // Go back to Challenge Detail + Challenge List pages
            Navigator.pop(context); // close this page
            Navigator.pop(context); // close detail page
          },
          child: const Text("Mark as Done"),
        ),
      ),
    );
  }
}