import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flutter/widgets.dart';

class NextsModel extends ChangeNotifier {
  List<TetroMino> nexts = TetroMino.values..shuffle();
  late TetroMino nextMino = nexts[0];

  void _supplyNexts() {
    if (nexts.length >= 6) return;

    nexts.addAll(TetroMino.values..shuffle());
  }

  void onMinoPlaced() {
    nexts.removeAt(0);
    _supplyNexts();

    nextMino = nexts[0];

    notifyListeners();
  }
}
