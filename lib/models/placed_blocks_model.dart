import 'package:flutter/widgets.dart';

import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/render/block.dart';

class PlacedBlocksModel extends ChangeNotifier {
  List<Block> placedBlocks = PlacedBlocks.placedBlocks;

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
}
