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
  late List<Cordinate> currentLocation;
  final MinoPlacement placement;
  final TetroMino minoType;

  /// ミノが存在する 3×3 (4×4) の空間の左上の座標
  // TODO y=21にミノがあった時は生成時y=23になるようにする
  Cordinate primeCordinate = Cordinate(3, 22);

  MinoLocation({required this.minoType}) : placement = MinoPlacement(minoType) {
    currentLocation = _parsePlacement(minoType.defaultPlacement);
  }

  void move(MoveDirection direction, PlacedBlocks placedBlocks) {
    switch (direction) {
      case MoveDirection.Up:
        _hardDrop(placedBlocks);
        return;
      case MoveDirection.Down:
        _down(placedBlocks);
        return;
      case MoveDirection.Right:
        _toRight(placedBlocks);
        return;
      case MoveDirection.Left:
        _toLeft(placedBlocks);
        return;
    }
  }

  void rotate(RotateDirection direction, PlacedBlocks placedBlocks) {
    final List<List<int>> rotatedPlacement = placement.provisiRotate(direction);
    final List<Cordinate> rotatedCordinates = _parsePlacement(rotatedPlacement);
    List<Cordinate> tmp = List.from(rotatedCordinates);

    final RotatePattern? rotatePattern =
        currentDirection.getRotatePattern(direction);

    if (rotatePattern == null) return;

    final Cordinate shift = rotatePattern.shiftedCordinates.firstWhere(
      (_shift) {
        tmp = rotatedCordinates.map((c) => c += _shift).toList();
        return placedBlocks.doseOverlapWith(tmp) ? false : true;
      },
      orElse: () => Cordinate(0, 0),
    );

    primeCordinate += shift;
    currentLocation.forEach((c) => c += shift);
  }

  void _toRight(PlacedBlocks placedBlocks) {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.toRight());
    primeTmp.toRight();

    if (placedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _toLeft(PlacedBlocks placedBlocks) {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.toLeft());
    primeTmp.toLeft();

    if (placedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _down(PlacedBlocks placedBlocks) {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.down());
    primeTmp.down();

    if (placedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _hardDrop(PlacedBlocks placedBlocks) {
    final List<Cordinate> fin = List<Cordinate>.from(currentLocation),
        tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;

    while (true) {
      tmp.forEach((c) => c.down());
      if (placedBlocks.doseOverlapWith(tmp)) break;
      fin.forEach((c) => c.down());
      primeTmp.down();
    }

    currentLocation = fin;
    primeCordinate = primeTmp;

    // 設置
  }

  List<Cordinate> _parsePlacement(List<List<int>> placement) {
    int x = 0, y = 0;
    final List<Cordinate> parsed = [];

    placement.forEach((row) {
      row.forEach((block) {
        parsed.add(primeCordinate + Cordinate(x, -y));
        x++;
      });
      y++;
    });

    return parsed;
  }
}
