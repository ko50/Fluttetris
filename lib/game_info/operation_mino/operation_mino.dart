import 'package:meta/meta.dart';

import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/operation_mino/mino_location.dart';
import 'package:flute_tris/game_info/render/block.dart';

class OperationMino {
  final TetroMino minoType;
  final MinoLocation location;
  List<Block> blocks;

  OperationMino({@required this.minoType})
      : location = MinoLocation(minoType: minoType) {
    _ensureBlocksAtCurrentCordinates();
  }

  /// ミノを回転
  void rotate(RotateDirection direction) {
    location.rotate(direction);
    _ensureBlocksAtCurrentCordinates();
  }

  /// ミノを左右/下に移動
  void move(MoveDirection direction) {
    location.move(direction);
    _ensureBlocksAtCurrentCordinates();
  }

  /// ミノの座標をblocksにも反映する
  void _ensureBlocksAtCurrentCordinates() => blocks = location.currentLocation
      .map<Block>((c) => Block(
            cordinate: c,
            color: minoType.color,
          ))
      .toList();
}
