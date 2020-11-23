import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';

class MinoPlacement {
  final TetroMino minoType;
  List<List<int>> currentPlacement;

  MinoPlacement(this.minoType) : currentPlacement = minoType.defaultPlacement;

  set rotate(List<List<int>> rotatedPlacement) =>
      currentPlacement = rotatedPlacement;

  List<List<int>> provisiRotate(RotateDirection direction) {
    if (minoType == TetroMino.O) return currentPlacement;

    List<List<int>> beforePlacement = List.from(
            direction == RotateDirection.Right
                ? currentPlacement.reversed.toList()
                : currentPlacement),
        rotatedPlacement = [[], [], []];
    if (minoType == TetroMino.I) rotatedPlacement.add([]);

    beforePlacement.asMap().forEach((horizonIndex, row) {
      row.asMap().forEach((blockIndex, _) => rotatedPlacement[horizonIndex]
          .add(beforePlacement[blockIndex][horizonIndex]));
    });

    return direction == RotateDirection.Right
        ? rotatedPlacement
        : rotatedPlacement.reversed.toList();
  }
}
