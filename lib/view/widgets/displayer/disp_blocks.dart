import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flute_tris/game_info/render/block.dart';
import 'package:flute_tris/models/operation_model.dart';
import 'package:flute_tris/models/placed_blocks_model.dart';
import 'package:flute_tris/view/widgets/tetromino/tetris_block.dart';

class BlockDisplayer extends StatelessWidget {
  final int height;
  final int width;

  static const double gridSize = 30.0;

  BlockDisplayer({
    required this.height,
    required this.width,
  });

  Widget _block() => Container(
        height: gridSize,
        width: gridSize,
        color: Colors.grey[400],
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.white),
        ),
      );

  Widget _background() {
    final List<Widget> row = List.filled(width, _block());
    final List<Row> rows = List.filled(height, Row(children: row));

    return Container(child: Column(children: rows));
  }

  @override
  Widget build(BuildContext context) {
    final List<Block> placedBlocks =
            Provider.of<PlacedBlocksModel>(context).placedBlocks,
        operationBlocks =
            Provider.of<OperationModel>(context).operationMino.blocks;

    final List<Widget> wholeBlocks = (placedBlocks + operationBlocks)
        .map((b) => TetrisBlock(block: b, gridSize: gridSize))
        .toList();

    return Container(
      height: height * gridSize,
      width: width * gridSize,
      decoration: BoxDecoration(boxShadow: [BoxShadow()]),
      child: Stack(children: [_background()] + wholeBlocks),
    );
  }
}
