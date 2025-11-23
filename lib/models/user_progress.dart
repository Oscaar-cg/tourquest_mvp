// This model keeps track of the user's progress.
// Simple for the MVP: XP + list of completed challenge IDs.

class UserProgress {
  int xp;                                     // Total XP earned
  List<String> completedChallenges;           // List of completed challenge IDs

  UserProgress({
    this.xp = 0,                               // Starting XP
    this.completedChallenges = const [],       // Empty list at the start
  });
}