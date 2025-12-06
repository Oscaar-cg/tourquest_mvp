import 'package:flutter/material.dart';
import 'challenge_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final quests = [
      {
        "id": "nature",
        "title": "Nature Walk",
        "description": "Find natural wonders and explore outside!",
        "color": Colors.green,
      },
      {
        "id": "city",
        "title": "City Explorer",
        "description": "Discover fun things in the city.",
        "color": Colors.indigo,
      },
      {
        "id": "indoor",
        "title": "Rainy Day Fun",
        "description": "Indoor challenges for bad weather.",
        "color": Colors.pink,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("SnapQuest"),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: quests.length,
        itemBuilder: (context, index) {
          final quest = quests[index];

          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChallengeListPage(
                      questId: quest["id"] as String,
                      questTitle: quest["title"] as String,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      backgroundColor:
                      (quest["color"] as Color).withOpacity(.15),
                      label: Text(
                        quest["title"] as String,
                        style: TextStyle(
                          color: quest["color"] as Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      quest["description"] as String,
                      style:
                      const TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Start Adventure →",
                      style: TextStyle(
                        color: quest["color"] as Color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}