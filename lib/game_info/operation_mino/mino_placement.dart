import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';

class MinoPlacement {
  List<List<int>> currentPlacement;

  MinoPlacement(this.currentPlacement);

  List<List<int>> rotate(RotateDirection direction, TetroMino minoType) {
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

  bool _tryDown() {
    List<List<int?>> placement = List.from(currentPlacement);

  }
}
