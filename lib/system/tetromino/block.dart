import 'package:flutter/material.dart';

import 'package:flute_tris/system/common/sqare_cordinate.dart';

class Block {
  final Color color;
  SqareCordinate cordinate;
  bool isActive = true;

  Block({
    @required this.cordinate,
    @required this.color,
  });
}
