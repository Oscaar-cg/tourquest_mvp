// Challenge Detail Page
// Shows more info about the selected challenge.
// User can press "Complete Challenge" to finish it.

import 'package:flutter/material.dart';
import '../models/challenge.dart';
import 'complete_challenge_page.dart';

class ChallengeDetailPage extends StatelessWidget {
  final Challenge challenge;

  const ChallengeDetailPage({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(challenge.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Difficulty: ${challenge.difficulty}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),
            Text(
              challenge.description,
              style: const TextStyle(fontSize: 16),
            ),

            const Spacer(),

            // Button to complete the challenge
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CompleteChallengePage(challenge: challenge),
                  ),
                );
              },
              child: const Text("Complete Challenge"),
            ),
          ],
        ),
      ),
    );
  }
}