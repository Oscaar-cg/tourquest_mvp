import 'package:flutter/material.dart';
import '../models/challenge.dart';
import '../storage/hive_storage.dart';

class CompleteChallengePage extends StatelessWidget {
  final Challenge challenge;

  const CompleteChallengePage({super.key, required this.challenge});

  void _validateChallenge() {
    final progress = HiveStorage.loadProgress();

    // Si pas encore validé, met à jour
    if (!progress.completedChallenges.contains(challenge.id)) {
      progress.completedChallenges.add(challenge.id);
      progress.xp += 50;
      challenge.completed = true;
      HiveStorage.saveProgress(progress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Challenge Completed",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // EMOJI DU CHALLENGE
            Text(
              challenge.icon,
              style: const TextStyle(fontSize: 70),
            ),

            const SizedBox(height: 20),

            Text(
              "Great job!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "You completed the challenge:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              challenge.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 28),
                  SizedBox(width: 10),
                  Text(
                    "+50 XP",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // FINISH BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _validateChallenge();
                  Navigator.pop(context); // fermer la page complete
                  Navigator.pop(context); // fermer la page detail
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Finish",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}