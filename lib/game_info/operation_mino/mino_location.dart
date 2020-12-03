import 'package:meta/meta.dart';

import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/enum/mino_direction.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/game_info/enum/rotate_pattern.dart';
import 'package:flute_tris/game_info/operation_mino/mino_placement.dart';

class MinoLocation {
  MinoDirection currentDirection = MinoDirection.N;
  List<Cordinate> currentLocation;
  final MinoPlacement placement;
  final TetroMino minoType;

  /// ミノが存在する 3×3 (4×4) の空間の左上の座標
  // TODO y=21にミノがあった時は生成時y=23になるようにする
  Cordinate primeCordinate = Cordinate(3, 20);

  MinoLocation({@required this.minoType})
      : placement = MinoPlacement(minoType) {
    currentLocation = _parsePlacement(minoType.defaultPlacement);
  }

  void move(MoveDirection direction) {
    switch (direction) {
      case MoveDirection.Up:
        _hardDrop();
        return;
      case MoveDirection.Down:
        _down();
        return;
      case MoveDirection.Right:
        _toRight();
        return;
      case MoveDirection.Left:
        _toLeft();
        return;
    }
  }

  void rotate(RotateDirection direction) {
    final List<List<int>> rotatedPlacement = placement.provisiRotate(direction);
    final List<Cordinate> rotatedCordinates = _parsePlacement(rotatedPlacement);
    List<Cordinate> tmp = List.from(rotatedCordinates);

    final RotatePattern rotatePattern =
        currentDirection.getRotatePattern(direction);

    if (rotatePattern == null) return;

    final Cordinate shift = rotatePattern.shiftedCordinates.firstWhere(
      (_shift) {
        tmp = rotatedCordinates.map((c) => c += _shift).toList();
        return PlacedBlocks.doseOverlapWith(tmp) ? false : true;
      },
      orElse: () => Cordinate(0, 0),
    );

    primeCordinate += shift;
    currentLocation.forEach((c) => c += shift);
  }

  void _toRight() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.toRight());
    primeTmp.toRight();

    if (PlacedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _toLeft() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.toLeft());
    primeTmp.toLeft();

    if (PlacedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _down() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.down());
    primeTmp.down();

    if (PlacedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _hardDrop() {
    final List<Cordinate> fin = List<Cordinate>.from(currentLocation),
        tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;

    while (true) {
      tmp.forEach((c) => c.down());
      if (PlacedBlocks.doseOverlapWith(tmp)) break;
      fin.forEach((c) => c.down());
      primeTmp.down();
    }

    currentLocation = fin;
    primeCordinate = primeTmp;

    // 設置
  }

  List<Cordinate> _parsePlacement(List<List<int>> placement) {
    final List<Cordinate> parsed = [];

    placement.toList().asMap().forEach((y, row) => row.asMap().forEach(
          (x, block) {
            if (block != 0) parsed.add(primeCordinate + Cordinate(x, y));
          },
        ));

    return parsed;
  }
}
