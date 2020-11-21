import 'package:flute_tris/game_info/common/cordinate.dart';

enum MoveDirection { Up, Right, Down, Left }

extension Movement on MoveDirection {
  Cordinate get movement {
    switch (this) {
      case MoveDirection.Right:
        return Cordinate(1, 0);
      case MoveDirection.Down:
        return Cordinate(0, -1);
      case MoveDirection.Left:
        return Cordinate(-1, 0);

      default:
        return null;
    }
  }
}
