import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/render/block.dart';

class PlacedBlocks {
  static final List<List<Block>> placedBlocks = [];

  static bool doseOverlapWith(List<Cordinate> pendingCordinates) {
    final bool isOverlapping = allCordinates.any(
      (row) => row.any(
        (cordinate) => pendingCordinates
            .any((pendingCordinate) => pendingCordinate.isStucking(cordinate)),
      ),
    );

    return isOverlapping;
  }

  static List<List<Cordinate>> get allCordinates => placedBlocks
      .map((row) => row.map((block) => block.cordinate).toList())
      .toList();
}
