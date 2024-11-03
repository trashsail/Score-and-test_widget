import 'package:test/test.dart';
import 'package:game_score/game.dart';

void main() {
  group('getScore', () {
    late List<Stamp> gameStamps;

    setUp(() {
      gameStamps = [
        Stamp(offset: 1, score: Score(home: 1, away: 0)),
        Stamp(offset: 2, score: Score(home: 1, away: 1)),
        Stamp(offset: 5, score: Score(home: 2, away: 1)),
        Stamp(offset: 6, score: Score(home: 2, away: 2)),
      ];
    });

    test('should return correct score for existing offset', () {
      final score = getScore(gameStamps, 2);
      expect(score.home, 1);
      expect(score.away, 1);
    });

    test('should return correct score for offset between two stamps', () {
      final score = getScore(gameStamps, 3);
      expect(score.home, 1);
      expect(score.away, 1);
    });

    //

    test('should throw RangeError for offset lower than minimum', () {
      expect(() => getScore(gameStamps, 0), throwsA(isA<RangeError>()));
    });

    test('should throw RangeError for offset higher than maximum', () {
      expect(() => getScore(gameStamps, 7), throwsA(isA<RangeError>()));
    });

    test('should throw RangeError for empty game stamps list', () {
      expect(() => getScore([], 1), throwsA(isA<RangeError>()));
    });
  });
}
