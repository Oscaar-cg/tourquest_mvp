// Challenge List Page
// Shows all the challenges from challenges_data.dart
// User can tap a challenge to see more details.

import 'package:flutter/material.dart';
import '../data/challenges_data.dart';
import 'challenge_detail_page.dart';

class ChallengeListPage extends StatelessWidget {
  const ChallengeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Challenges")),
      body: ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          final c = challenges[index];

          return ListTile(
            title: Text(c.title),
            subtitle: Text(c.difficulty),
            trailing: Icon(
              c.completed ? Icons.check_circle : Icons.circle_outlined,
              color: c.completed ? Colors.green : Colors.grey,
            ),
            onTap: () {
              // Open detail page for this challenge
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChallengeDetailPage(challenge: c),
                ),
              );
            },
          );
        },
      ),
    );
  }
}