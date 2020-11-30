import 'package:flute_tris/game_info/render/block.dart';
import 'package:flutter/material.dart';

class TetrisBlock extends StatelessWidget {
  final Block block;
  final double gridSize;

  TetrisBlock({
    required this.block,
    required int gridSize,
  }) : gridSize = gridSize.toDouble();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: gridSize,
      width: gridSize,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.white),
        color: block.color,
      ),
    );
  }
}
