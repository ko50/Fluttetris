import 'package:flutter/material.dart';

import 'package:flute_tris/game_info/common/cordinate.dart';

class Block {
  final Color color;
  Cordinate cordinate;
  bool isActive = true;

  Block({
    @required this.cordinate,
    @required this.color,
  });
}
