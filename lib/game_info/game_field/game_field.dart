import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/game_info/operation_mino/operation_mino.dart';

class GameField {
  OperationMino operationMino;
  bool pause = true;
  Timer timer;

  GameField({@required this.operationMino}) {
    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      if (!pause) operationMino.move(MoveDirection.Down);
    });
  }
}
