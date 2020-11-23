import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/game_info/enum/rotate_pattern.dart';

enum MinoDirection { N, W, S, E }

extension ConvertRotatePattern on MinoDirection {
  RotatePattern? getRotatePattern(RotateDirection direction) {
    final bool isRight = direction == RotateDirection.Right;

    switch (this) {
      case MinoDirection.N:
        return isRight ? RotatePattern.NtoE : RotatePattern.NtoW;
      case MinoDirection.E:
        return isRight ? RotatePattern.EtoS : RotatePattern.EtoN;
      case MinoDirection.S:
        return isRight ? RotatePattern.StoW : RotatePattern.StoE;
      case MinoDirection.W:
        return isRight ? RotatePattern.WtoN : RotatePattern.WtoS;
      default:
        return null;
    }
  }
}
