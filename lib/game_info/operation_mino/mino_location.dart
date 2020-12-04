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
        print('\n$currentLocation');
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
        final bool anyExcesses = tmp.any((c) => c.isExcess);

        return !PlacedBlocks.doseOverlapWith(tmp) && !anyExcesses;
      },
      orElse: () => null,
    );

    if (shift != null) {
      placement.rotate = rotatedPlacement;
      currentLocation = rotatedCordinates;

      primeCordinate += shift;
      currentLocation.forEach((c) => c += shift);
    }
  }

  void _toRight() {
    List<Cordinate> tmp = List.filled(currentLocation.length, Cordinate(0, 0));
    Cordinate primeTmp = Cordinate(0, 0);

    tmp.asMap().forEach((index, _) => tmp[index] += currentLocation[index]);
    primeTmp += primeCordinate;

    tmp.forEach((c) => c.toRight());
    primeTmp.toRight();

    final bool anyExcesses = tmp.any((c) => c.isExcess);

    if (PlacedBlocks.doseOverlapWith(tmp) || anyExcesses) return;

    currentLocation = tmp;
    primeCordinate = primeTmp;
  }

  void _toLeft() {
    List<Cordinate> tmp = List.filled(currentLocation.length, Cordinate(0, 0));
    Cordinate primeTmp = Cordinate(0, 0);

    tmp.asMap().forEach((index, _) => tmp[index] += currentLocation[index]);
    primeTmp += primeCordinate;

    tmp.forEach((c) => c.toLeft());
    primeTmp.toLeft();

    final bool anyExcesses = tmp.any((c) => c.isExcess);

    if (PlacedBlocks.doseOverlapWith(tmp) || anyExcesses) return;

    currentLocation = tmp;
    primeCordinate = primeTmp;
  }

  void _down() {
    List<Cordinate> tmp = List.filled(currentLocation.length, Cordinate(0, 0));
    Cordinate primeTmp = Cordinate(0, 0);

    tmp.asMap().forEach((index, _) => tmp[index] += currentLocation[index]);
    primeTmp += primeCordinate;

    tmp.forEach((c) => c.down());
    primeTmp.down();

    final bool anyExcesses = tmp.any((c) => c.isExcess);

    if (PlacedBlocks.doseOverlapWith(tmp) || anyExcesses) return;

    currentLocation = tmp;
    primeCordinate = primeTmp;
  }

  void _hardDrop() {
    final List<Cordinate> fin = List<Cordinate>.filled(
      currentLocation.length,
      Cordinate(0, 0),
    );
    final List<Cordinate> tmp = List<Cordinate>.filled(
      currentLocation.length,
      Cordinate(0, 0),
    );
    Cordinate primeTmp = Cordinate(0, 0);

    fin.asMap().forEach((index, _) => fin[index] += currentLocation[index]);
    tmp.asMap().forEach((index, _) => tmp[index] += currentLocation[index]);
    primeTmp += primeCordinate;

    bool anyExcesses = false;

    while (true) {
      tmp.forEach((c) => c.down());
      anyExcesses = tmp.any((c) => c.isExcess);

      if (PlacedBlocks.doseOverlapWith(tmp) || anyExcesses) break;
      fin.forEach((c) => c.down());
      print(fin);
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
            if (block != 0) parsed.add(primeCordinate + Cordinate(x, -y));
          },
        ));

    return parsed;
  }
}
