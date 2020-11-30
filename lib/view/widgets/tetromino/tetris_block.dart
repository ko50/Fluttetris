import 'package:flute_tris/game_info/render/block.dart';
import 'package:flutter/material.dart';

class TetrisBlock extends StatelessWidget {
  final Block block;
  final double gridSize;

  TetrisBlock({
    required this.block,
    required this.gridSize,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: gridSize,
      width: gridSize,
      left: block.cordinate.x * gridSize,
      bottom: block.cordinate.y * gridSize,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.white),
          color: block.color,
        ),
      ),
    );
  }
}
