// This model represents a single challenge in the app.
// A challenge has basic info + a "completed" status.

class Challenge {
  final String id;               // Unique ID for the challenge
  final String title;            // Short title (ex: “SUU sign photo”)
  final String description;      // Small description of what to do
  final String difficulty;       // Easy / Medium / Hard
  bool completed;                // If the user completed it or not

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.difficulty,
    this.completed = false,      // Default value: not completed
  });
}