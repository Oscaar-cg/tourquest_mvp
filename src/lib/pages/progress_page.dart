import 'package:flutter/material.dart';
import '../storage/hive_storage.dart';
import '../data/quests_data.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final progress = HiveStorage.loadProgress();
    final completedCount = progress.completedChallenges.length;

    double xpPercent = progress.xp / 500;
    if (xpPercent > 1) xpPercent = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Progress"),
        backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your XP",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Container(
              height: 22,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: xpPercent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            Text(
              "${progress.xp} XP / 500 XP",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 25),
            const Divider(),
            const SizedBox(height: 25),

            const Text(
              "Challenges Completed",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Text(
              "$completedCount completed",
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),

            const Spacer(),

            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                ),
                onPressed: () {
                  HiveStorage.reset();   // Reset XP + completed + photos
                  resetAllChallenges();  // Reset des challenges en mémoire

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("All progress & quests reset!"),
                    ),
                  );
                },
                child: const Text(
                  "Reset Progress",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}