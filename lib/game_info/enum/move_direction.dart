import 'package:flute_tris/game_info/common/sqare_cordinate.dart';

enum MoveDirection { Up, Right, Down, Left }

extension Movement on MoveDirection {
  SqareCordinate get movement {
    switch (this) {
      case MoveDirection.Right:
        return SqareCordinate(1, 0);
      case MoveDirection.Down:
        return SqareCordinate(0, -1);
      case MoveDirection.Left:
        return SqareCordinate(-1, 0);

      default:
        return null;
    }
  }
}
