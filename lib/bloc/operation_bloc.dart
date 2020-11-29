import 'dart:async';

import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/game_info/operation_mino/operation_mino.dart';

class OperationBloc {
  OperationMino operationMino;

  OperationBloc(TetroMino minoType)
      : operationMino = OperationMino(minoType: minoType);

  final StreamController<List<Cordinate>> _minoCordinateController =
      StreamController<List<Cordinate>>();

  Stream<List<Cordinate>> get minoCordinateStream =>
      _minoCordinateController.stream;

  void _updateCordinate() =>
      _minoCordinateController.sink.add(operationMino.location.currentLocation);

  void move(MoveDirection direction) {
    operationMino.move(direction);
    _updateCordinate();
  }

  void rotate(RotateDirection direction) {
    operationMino.rotate(direction);
    _updateCordinate();
  }

  void put(TetroMino next) {
    PlacedBlocks.placedBlocks.addAll(operationMino.blocks);
    operationMino = OperationMino(minoType: next);

    _updateCordinate();
  }

  void dispose() {
    _minoCordinateController.close();
  }
}
