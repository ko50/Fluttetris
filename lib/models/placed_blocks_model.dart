import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/render/block.dart';

class PlacedBlocksModel extends ChangeNotifier {
  List<Block> placedBlocks = PlacedBlocks.placedBlocks;

  void addPlacedBlocks(List<Block> newBlocks) {
    PlacedBlocks.placedBlocks.addAll(newBlocks);
    notifyListeners();
  }

  int clearFilledLine() {
    int clearedLineCount = 0;
    List<int> canClearedLinesY = [];
    List<Cordinate> line = [];

    for (int i = 0; i < 21; i++) {
      line = PlacedBlocks.allCordinates.where((c) => c.y == i).toList();

      if (line.length == 10) {
        canClearedLinesY.add(i);
        clearedLineCount++;
      }
    }

    canClearedLinesY.forEach((y) => PlacedBlocks.placedBlocks.removeWhere(
          (block) => block.cordinate.y == y,
        ));

    placedBlocks = PlacedBlocks.placedBlocks;
    notifyListeners();

    return clearedLineCount;
  }

  List<Block> fillBlank(List<Block> operationBlocks, int height, int width) {
    final List<Block> alreadyAssigned = operationBlocks + placedBlocks;
    final List<Block> whole = [];

    for (int y = height; y > 0; y--) {
      for (int x = 0; x < width; x++) {
        final Cordinate current = Cordinate(x, y);
        final Block pointedBlock = alreadyAssigned.firstWhere(
          (b) => b.cordinate == current,
          orElse: () => null,
        );

        whole.add(pointedBlock == null
            ? Block(cordinate: current, color: Colors.grey[400])
            : pointedBlock);
      }
    }

    return whole;
  }
}
