enum Difficulty { easy, medium, hard, extreme }

extension DifficultyConfig on Difficulty {
  int get min => 1;

  int get max => switch (this) {
    Difficulty.easy => 10,
    Difficulty.medium => 20,
    Difficulty.hard => 100,
    Difficulty.extreme => 1000,
  };

  int get attempts => switch (this) {
    Difficulty.easy => 5,
    Difficulty.medium => 8,
    Difficulty.hard => 15,
    Difficulty.extreme => 25,
  };

  String get label => switch (this) {
    Difficulty.easy => 'Easy',
    Difficulty.medium => 'Medium',
    Difficulty.hard => 'Hard',
    Difficulty.extreme => 'Extreme',
  };
}
