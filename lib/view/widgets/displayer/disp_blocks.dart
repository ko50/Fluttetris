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
    @required this.height,
    @required this.width,
  });

  Widget _block() => Flexible(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            height: gridSize,
            width: gridSize,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              border: Border.all(width: 1.0, color: Colors.white),
            ),
          ),
        ),
      );

  Widget _background() {
    final List<Widget> row = List.filled(width, _block());
    final List<Widget> rows =
        List.filled(height, Flexible(child: Row(children: row)));

    return Container(child: Column(children: rows));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, PlacedBlocksModel placedBlocksModel, _) {
        final List<Block> placedBlocks = placedBlocksModel.placedBlocks;

        return Consumer(
          builder: (BuildContext context, OperationModel operationModel, __) {
            // final List<Block> operationBlocks = operationModel.operationMino.blocks;

            final List<Widget> wholeBlocks = (placedBlocks + [])
                .map((b) => TetrisBlock(block: b, gridSize: gridSize))
                .toList();

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(children: [_background()] + wholeBlocks),
            );
          },
        );
      },
    );
  }
}
