import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/render/block.dart';

class PlacedBlocks {
  static final List<Block> placedBlocks = [];

  static bool doseOverlapWith(List<Cordinate> pendingCordinates) {
    final bool isOverlapping = allCordinates.any(
      (cordinate) => pendingCordinates
          .any((pendingCordinate) => pendingCordinate.isStucking(cordinate)),
    );

    return isOverlapping;
  }

  static List<Cordinate> get allCordinates =>
      placedBlocks.map((block) => block.cordinate).toList();

  static int clearFilledLine() {
    int clearedLineCount = 0;
    List<int> canClearedLinesY = [];
    List<Cordinate> line = [];

    for (int i = 0; i < 21; i++) {
      line = allCordinates.where((c) => c.y == i).toList();

      if (line.length == 10) {
        canClearedLinesY.add(i);
        clearedLineCount++;
      }
    }

    canClearedLinesY.forEach((y) => placedBlocks.removeWhere(
          (block) => block.cordinate.y == y,
        ));

    return clearedLineCount;
  }
}
