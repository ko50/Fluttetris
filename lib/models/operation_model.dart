import 'package:flute_tris/game_info/render/block.dart';
import 'package:flutter/widgets.dart';

import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/game_info/operation_mino/operation_mino.dart';

class OperationModel extends ChangeNotifier {
  OperationMino operationMino;

  OperationModel(TetroMino minoType)
      : operationMino = OperationMino(minoType: minoType);

  void move(MoveDirection direction) {
    operationMino.move(direction);
    notifyListeners();
  }

  void rotate(RotateDirection direction) {
    operationMino.rotate(direction);
    notifyListeners();
  }

  void put(TetroMino next, void Function(List<Block>) putNotifier) {
    putNotifier(operationMino.blocks);
    operationMino = OperationMino(minoType: next);

    notifyListeners();
  }
}
