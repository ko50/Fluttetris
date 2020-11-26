import 'package:flute_tris/game_info/enum/mino_type.dart';

class Nexts {
  static List<TetroMino> nexts = TetroMino.values..shuffle();
  static late TetroMino nextMino = nexts[0];

  static void supplyNexts() {
    if (nexts.length >= 6) return;

    nexts.addAll(TetroMino.values..shuffle());
  }

  static void onMinoPlaced() {
    nexts.removeAt(0);
    supplyNexts();

    nextMino = nexts[0];
  }
}
