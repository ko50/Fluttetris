import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/render/block.dart';
import 'package:flutter/widgets.dart';

class PlacedBlocks with ChangeNotifier {
  static final List<Block> placedBlocks = [];

  static bool doseOverlapWith(List<Cordinate> pendingCordinates) {
    final bool isOverlapping = allCordinates.any(
      (cordinate) => pendingCordinates
          .any((pendingCordinate) => pendingCordinate.isStucking(cordinate)),
    );

    return isOverlapping;
  }

  static bool isAssignedUnderOf(List<Cordinate> cordinates) =>
      cordinates.any((c) {
        if (c.y <= 0) return true;

        final Cordinate under = c..down();
        return allCordinates.any((c) => c.isStucking(under));
      });

  static List<Cordinate> get allCordinates =>
      placedBlocks.map((block) => block.cordinate).toList();
}
