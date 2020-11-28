import 'dart:async';

import 'package:flute_tris/game_info/enum/mino_type.dart';

class HoldBloc {
  TetroMino? holdedMino;

  final StreamController<TetroMino?> _holdController =
      StreamController<TetroMino?>();

  Stream<TetroMino?> get onMinoHolded => _holdController.stream;

  void hold(TetroMino mino) {
    _holdController.add(holdedMino);
    holdedMino = mino;
  }

  void dispose() => _holdController.close();
}
