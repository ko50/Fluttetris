import 'package:flutter/material.dart';

import 'package:flute_tris/game_info/common/cordinate.dart';

class TetrisBlock extends StatelessWidget {
  final Cordinate cordinate;
  final Color color;
  final double gridSize;

  TetrisBlock({
    @required this.cordinate,
    @required this.color,
    @required this.gridSize,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: gridSize,
      width: gridSize,
      left: cordinate.x * gridSize,
      bottom: cordinate.y * gridSize,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.white),
          color: color,
        ),
      ),
    );
  }
}
