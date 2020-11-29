import 'dart:async';

import 'package:flute_tris/game_info/enum/mino_type.dart';

class NextsBloc {
  List<TetroMino> nexts = TetroMino.values..shuffle();
  late TetroMino nextMino = nexts[0];

  final StreamController<TetroMino> _nextsController =
      StreamController<TetroMino>();

  Stream<TetroMino> get onRotatedNexts => _nextsController.stream;

  void supplyNexts() {
    if (nexts.length >= 6) return;

    nexts.addAll(TetroMino.values..shuffle());
  }

  void onMinoPlaced() {
    _nextsController.add(nextMino);
    nexts.removeAt(0);
    supplyNexts();

    nextMino = nexts[0];
  }

  void close() => _nextsController.close();
}
