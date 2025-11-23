// Progress Page
// Shows the user's XP and the list of completed challenges.
// Super simple but enough to show real progress in the MVP.

import 'package:flutter/material.dart';
import '../storage/hive_storage.dart';
import '../data/challenges_data.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Load saved XP + completed IDs
    final progress = HiveStorage.loadProgress();

    return Scaffold(
      appBar: AppBar(title: const Text("My Progress")),
      body: ListView(
        children: [
          // XP Display
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "XP: ${progress.xp}",
              style: const TextStyle(fontSize: 22),
            ),
          ),

          // Completed challenges list
          ...challenges
              .where((c) => progress.completedChallenges.contains(c.id))
              .map(
                (c) => ListTile(
              title: Text(c.title),
              subtitle: const Text("Completed"),
              leading: const Icon(Icons.check_circle, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}