import 'package:flute_tris/system/common/sqare_cordinate.dart';
import 'package:flute_tris/system/tetromino/block.dart';

class PlacedBlocks {
  PlacedBlocks();

  static final List<List<Block>> placedBlocks = [];

  static List<List<SqareCordinate>> get allCordinates => placedBlocks
      .map((row) => row.map((block) => block.cordinate).toList())
      .toList();

  bool isOverlappingBy(List<SqareCordinate> pendingMino) {
    final bool isOverlapping = allCordinates.any((row) => row.any(
          (cordinate) => pendingMino.any(
              (pendingCordinate) => pendingCordinate.isConflicting(cordinate)),
        ));

    return isOverlapping;
  }
}
