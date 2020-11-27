import 'package:flute_tris/game_info/enum/mino_type.dart';

class HoldedMino {
  static TetroMino? holdedMino;

  static TetroMino? hold(TetroMino mino) {
    final TetroMino? tmp = holdedMino;
    holdedMino = mino;

    return tmp;
  }
}
