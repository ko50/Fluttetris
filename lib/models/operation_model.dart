import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/game_info/operation_mino/operation_mino.dart';

class OperationModel extends ChangeNotifier {
  OperationMino operationMino;
  Timer timer;

  OperationModel(TetroMino minoType)
      : operationMino = OperationMino(minoType: minoType) {
    _initiateTimer();
  }

  void _initiateTimer() {
    // TODO ポーズ機能実装 & タイマーへの反映
    timer = Timer.periodic(
      Duration(milliseconds: 750),
      (_) {
        operationMino.move(MoveDirection.Down);
        notifyListeners();
      },
    );
  }

  void move(MoveDirection direction) {
    operationMino.move(direction);
    notifyListeners();
  }

  void rotate(RotateDirection direction) {
    operationMino.rotate(direction);
    notifyListeners();
  }

  void put(TetroMino next) {
    PlacedBlocks.placedBlocks.addAll(operationMino.blocks);
    operationMino = OperationMino(minoType: next);

    notifyListeners();
  }
}
