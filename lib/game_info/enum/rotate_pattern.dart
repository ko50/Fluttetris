import 'package:flute_tris/game_info/common/cordinate.dart';

enum RotatePattern { NtoE, EtoN, EtoS, StoE, StoW, WtoS, WtoN, NtoW }

extension RotatePatternWallKick on RotatePattern {
  List<Cordinate> get shiftedCordinates {
    switch (this) {
      case RotatePattern.NtoE:
        return [
          Cordinate(0, 0),
          Cordinate(-1, 0),
          Cordinate(-1, 1),
          Cordinate(0, -2),
          Cordinate(-1, -2),
        ];
      case RotatePattern.EtoN:
        return [
          Cordinate(0, 0),
          Cordinate(1, 0),
          Cordinate(1, -1),
          Cordinate(0, 2),
          Cordinate(1, 2),
        ];
      case RotatePattern.EtoS:
        return [
          Cordinate(0, 0),
          Cordinate(1, 0),
          Cordinate(1, -1),
          Cordinate(0, 2),
          Cordinate(1, 2),
        ];
      case RotatePattern.StoE:
        return [
          Cordinate(0, 0),
          Cordinate(-1, 0),
          Cordinate(-1, 1),
          Cordinate(0, -2),
          Cordinate(1, -2),
        ];
      case RotatePattern.StoW:
        return [
          Cordinate(0, 0),
          Cordinate(1, 0),
          Cordinate(1, 1),
          Cordinate(0, -2),
          Cordinate(1, -2),
        ];
      case RotatePattern.WtoS:
        return [
          Cordinate(0, 0),
          Cordinate(-1, 0),
          Cordinate(-1, -1),
          Cordinate(0, 2),
          Cordinate(-1, 2),
        ];
      case RotatePattern.WtoN:
        return [
          Cordinate(0, 0),
          Cordinate(-1, 0),
          Cordinate(-1, -1),
          Cordinate(0, 2),
          Cordinate(-1, 2),
        ];
      case RotatePattern.NtoW:
        return [
          Cordinate(0, 0),
          Cordinate(1, 0),
          Cordinate(1, 1),
          Cordinate(0, -2),
          Cordinate(1, -2),
        ];
      default:
        return null;
    }
  }
}
