import 'package:meta/meta.dart';

import 'package:flute_tris/system/common/enum/move_direction.dart';
import 'package:flute_tris/system/common/rotate_direction.dart';
import 'package:flute_tris/system/common/sqare_cordinate.dart';
import 'package:flute_tris/system/tetromino/block.dart';
import 'package:flute_tris/system/tetromino/mino_placement.dart';
import 'package:flute_tris/system/tetromino/enum/mino_type.dart';
import 'package:flute_tris/system/tetromino/placed_blocks.dart';

class InOperationMino {
  final TetroMino minoType;
  final MinoPlacement placement;
  final List<Block> blocks;

  /// ミノを囲む 3×3 / 4×4 マスの範囲のうちの左上の座標
  ///
  /// 初期値 = 左から4マス、最上部
  SqareCordinate maserCordinate = SqareCordinate(4, 20);

  InOperationMino({
    @required this.minoType,
    @required this.placement,
    @required this.blocks,
  });

  /// ミノを回転
  void rotate(RotateDirection direction) {
    final rotatedPlacement = placement.rotate(direction, minoType),
        rotatedCordinates = assignBlocksCordinatesBy(rotatedPlacement),
        currentPlacedBlocks = PlacedBlocks.allCordinates;
  }

  List<SqareCordinate> assignBlocksCordinatesBy(List<List<int>> placement) {
    final assignedCordinates = <SqareCordinate>[];
    int x, y = 0;

    placement.forEach((row) {
      x = 0;
      row.forEach((block) {
        if (block == 1) {
          SqareCordinate cordinate = SqareCordinate(x, y);
          assignedCordinates.add(cordinate);
        }
        x += 1;
      });
      y -= 1;
    });

    return assignedCordinates;
  }

  void move(MoveDirection direction) {
    blocks.forEach((block) {});
  }
}
