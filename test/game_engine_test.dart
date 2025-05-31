import 'package:flutter_test/flutter_test.dart';
import 'package:adivina_el_numero/core/game_engine.dart';
import 'package:adivina_el_numero/core/models/difficulty.dart';
import 'package:adivina_el_numero/core/models/game_status.dart';

void main() {
  group('GameEngine', () {
    test('generates secret within range and attempts count', () {
      final engine = GameEngine(difficulty: Difficulty.medium);
      expect(engine.secret, inInclusiveRange(1, 20));
      expect(engine.attemptsLeft, 8);
      expect(engine.status, GameStatus.playing);
    });

    test('win scenario', () {
      final engine = GameEngine();
      final secret = engine.secret;
      final result = engine.guess(secret);
      expect(result, GameStatus.won);
      expect(engine.status, GameStatus.won);
    });

    test('lose scenario after max attempts', () {
      final engine = GameEngine(difficulty: Difficulty.easy);
      final wrong = engine.secret == engine.difficulty.max
          ? engine.difficulty.min
          : engine.difficulty.max;
      for (var i = 0; i < engine.difficulty.attempts; i++) {
        engine.guess(wrong);
      }
      expect(engine.status, GameStatus.lost);
      expect(engine.attemptsLeft, 0);
    });

    test('throws if value out of range', () {
      final engine = GameEngine();
      expect(() => engine.guess(0), throwsArgumentError);
    });
  });
}
