import 'package:flute_tris/system/common/sqare_cordinate.dart';

enum RotatePattern { NtoE, EtoN, EtoS, StoE, StoW, WtoS, WtoN, NtoW }

extension RotatePatternWallKick on RotatePattern {
  List<SqareCordinate> get shiftedCordinates {
    switch (this) {
      case RotatePattern.NtoE:
        return [
          SqareCordinate(0, 0),
          SqareCordinate(-1, 0),
          SqareCordinate(-1, 1),
          SqareCordinate(0, -2),
          SqareCordinate(-1, -2),
        ];
      case RotatePattern.EtoN:
        return [
          SqareCordinate(0, 0),
          SqareCordinate(1, 0),
          SqareCordinate(1, -1),
          SqareCordinate(0, 2),
          SqareCordinate(1, 2),
        ];
      case RotatePattern.EtoS:
        return [
          SqareCordinate(0, 0),
          SqareCordinate(1, 0),
          SqareCordinate(1, -1),
          SqareCordinate(0, 2),
          SqareCordinate(1, 2),
        ];
      case RotatePattern.StoE:
        return [
          SqareCordinate(0, 0),
          SqareCordinate(-1, 0),
          SqareCordinate(-1, 1),
          SqareCordinate(0, -2),
          SqareCordinate(1, -2),
        ];
      case RotatePattern.StoW:
        return [
          SqareCordinate(0, 0),
          SqareCordinate(1, 0),
          SqareCordinate(1, 1),
          SqareCordinate(0, -2),
          SqareCordinate(1, -2),
        ];
      case RotatePattern.WtoS:
        return [
          SqareCordinate(0, 0),
          SqareCordinate(-1, 0),
          SqareCordinate(-1, -1),
          SqareCordinate(0, 2),
          SqareCordinate(-1, 2),
        ];
      case RotatePattern.WtoN:
        return [
          SqareCordinate(0, 0),
          SqareCordinate(-1, 0),
          SqareCordinate(-1, -1),
          SqareCordinate(0, 2),
          SqareCordinate(-1, 2),
        ];
      case RotatePattern.NtoW:
        return [
          SqareCordinate(0, 0),
          SqareCordinate(1, 0),
          SqareCordinate(1, 1),
          SqareCordinate(0, -2),
          SqareCordinate(1, -2),
        ];
      default:
        return null;
    }
  }
}
