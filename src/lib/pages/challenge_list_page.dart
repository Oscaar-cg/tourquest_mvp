import 'package:flutter/material.dart';
import '../data/quests_data.dart';
import 'challenge_detail_page.dart';

class ChallengeListPage extends StatelessWidget {
  final String questId;
  final String questTitle;

  const ChallengeListPage({
    super.key,
    required this.questId,
    required this.questTitle,
  });

  @override
  Widget build(BuildContext context) {
    final challenges = questChallenges[questId] ?? [];
    int completed = challenges.where((c) => c.completed).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(questTitle),
      ),

      body: Column(
        children: [
          //PROGRESS BAR
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text("$completed / ${challenges.length} completed"),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: completed / challenges.length,
                  color: Colors.blue,
                  backgroundColor: Colors.grey.shade300,
                ),
              ],
            ),
          ),

          // CHALLENGE LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                final c = challenges[index];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: ListTile(
                    leading: Text(
                      c.icon,
                      style: TextStyle(
                        fontSize: 28,
                        color: c.completed ? Colors.grey : Colors.black,
                      ),
                    ),

                    title: Text(
                      c.title,
                      style: TextStyle(
                        color: c.completed ? Colors.grey : Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),

                    trailing: c.completed
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.arrow_forward_ios, size: 16),

                    onTap: () {
                      if (c.completed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("You already completed this challenge!"),
                          ),
                        );
                        return;
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChallengeDetailPage(challenge: c),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}