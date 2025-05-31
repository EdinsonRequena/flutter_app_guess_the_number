import 'dart:math';
import 'package:flutter/foundation.dart';
import 'models/difficulty.dart';
import 'models/game_status.dart';

class GameEngine with ChangeNotifier {
  GameEngine({Difficulty difficulty = Difficulty.easy}) : _difficulty = difficulty {
    _reset();
  }

  final Random _rng = Random();
  late int _secret;
  late int _attemptsLeft;
  Difficulty _difficulty;
  GameStatus _status = GameStatus.playing;

  final List<int> greaterGuesses = [];
  final List<int> lessGuesses = [];

  Difficulty get difficulty => _difficulty;
  int get attemptsLeft => _attemptsLeft;
  GameStatus get status => _status;
  int get secret => _secret;

  void setDifficulty(Difficulty newDifficulty) {
    _difficulty = newDifficulty;
    _reset();
  }

  /// Devuelve:
  /// - `GameStatus.won`   si acertó
  /// - `GameStatus.lost`  si se quedó sin intentos tras el guess
  /// - `GameStatus.playing` si aún sigue
  ///
  /// Lanza [ArgumentError] si el valor está fuera de rango.
  GameStatus guess(int value) {
    if (value < _difficulty.min || value > _difficulty.max) {
      throw ArgumentError('Value $value is out of range ${_difficulty.min}-${_difficulty.max}');
    }
    if (_status != GameStatus.playing) return _status;

    if (value == _secret) {
      _status = GameStatus.won;
    } else {
      _attemptsLeft--;
      if (value > _secret) {
        greaterGuesses.add(value);
      } else {
        lessGuesses.add(value);
      }
      if (_attemptsLeft == 0) _status = GameStatus.lost;
    }
    notifyListeners();
    return _status;
  }

  void _reset() {
    greaterGuesses.clear();
    lessGuesses.clear();
    _secret = _rng.nextInt(_difficulty.max - _difficulty.min + 1) + _difficulty.min;
    _attemptsLeft = _difficulty.attempts;
    _status = GameStatus.playing;
    notifyListeners();
  }
}
