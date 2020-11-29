import 'dart:async';

import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flutter/widgets.dart';

class HoldModel extends ChangeNotifier {
  TetroMino? holdedMino;

  void hold(TetroMino mino) {
    holdedMino = mino;
    notifyListeners();
  }
}
