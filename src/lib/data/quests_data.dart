import '../models/challenge.dart';

final Map<String, List<Challenge>> questChallenges = {
  "city": [
    Challenge(
      id: "c1",
      title: "Take a street photo",
      description: "Find something interesting downtown.",
      difficulty: "Easy",
      icon: "📸",
    ),
  ],

  "nature": [
    Challenge(
      id: "n1",
      title: "Find a leaf",
      description: "Take a picture of a cool leaf.",
      difficulty: "Easy",
      icon: "🍃",
    ),
    Challenge(
      id: "n2",
      title: "Bird picture",
      description: "Capture a bird around you.",
      difficulty: "Medium",
      icon: "🐦",
    ),
  ],

  "indoor": [
    Challenge(
      id: "i1",
      title: "Find something red",
      description: "Take a photo of anything red inside.",
      difficulty: "Easy",
      icon: "🔴",
    ),
  ],
};

void resetAllChallenges() {
  for (var quest in questChallenges.values) {
    for (var c in quest) {
      c.completed = false;
    }
  }
}