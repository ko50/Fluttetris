import 'package:flute_tris/game_info/operation_mino/mino_location.dart';

import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/render/block.dart';

class OperationMino {
  final TetroMino minoType;
  final MinoLocation location;
  late final List<Block> blocks;

  OperationMino({required this.minoType})
      : location = MinoLocation(minoType: minoType) {
    blocks = location.currentLocation
        .map<Block>((c) => Block(
              cordinate: c,
              color: minoType.color,
            ))
        .toList();
  }

  // TODO ミノの現在の座標を随時blocksに繁栄しないといけないので関数を書け
  /// ミノを回転
  void rotate(RotateDirection direction) => location.rotate(direction);

  /// ミノを左右/下に移動
  void move(MoveDirection direction) => location.move(direction);
}
