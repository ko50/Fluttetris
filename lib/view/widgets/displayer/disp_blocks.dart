import 'package:flute_tris/game_info/common/cordinate.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, PlacedBlocksModel placedBlocksModel, _) {
        return Consumer(
          builder: (BuildContext context, OperationModel operationModel, __) {
            final List<Block> operationBlocks =
                operationModel.operationMino.blocks;

            final List<Block> filledField =
                placedBlocksModel.fillBlank(operationBlocks, height, width);

            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              height: height * gridSize,
              width: width * gridSize,
              child: GridView.count(
                crossAxisCount: 10,
                children: filledField
                    .map((b) => TetrisBlock(
                          cordinate: b.cordinate,
                          color: b.color,
                          gridSize: 30,
                        ))
                    .toList(),
              ),
            );
          },
        );
      },
    );
  }
}
