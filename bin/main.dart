import 'package:game_score/game.dart';

void main() {
  final game = generateGame();
  final score = getScore(game, 98050);

  game.forEach((e) {
    print(
        "offset - ${e.offset}; away - ${e.score.away}; home - ${e.score.home};");
  });
  print(score);
}
