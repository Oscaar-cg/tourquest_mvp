// This file contains a small list of challenges for the MVP.
// For now everything is static (no database yet).
// Later you can move this to Firebase or your own backend.

import '../models/challenge.dart';

// List of sample challenges for Cedar City.
// Simple, just enough to show the app logic in class.

List<Challenge> challenges = [
  Challenge(
    id: "1",
    title: "Photo in front of SUU sign",
    description: "Take a picture in front of the official SUU campus sign.",
    difficulty: "Easy",
  ),
  Challenge(
    id: "2",
    title: "Local Restaurant Visit",
    description: "Eat at a local Cedar City restaurant and explore local food.",
    difficulty: "Easy",
  ),
  Challenge(
    id: "3",
    title: "3-Hour Hiking Trail",
    description: "Do the Canyon Trail: take one photo mid-way and one at the top.",
    difficulty: "Hard",
  ),
];