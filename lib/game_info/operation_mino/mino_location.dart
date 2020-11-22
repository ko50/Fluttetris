import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/common/placed_blocks.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/game_info/operation_mino/mino_placement.dart';

class MinoLocation {
  List<Cordinate> currentLocation;
  final MinoPlacement placement;

  /// ミノが存在する 3×3 (4×4) の空間の左上の座標
  // TODO y=21にミノがあった時は生成時y=23になるようにする
  Cordinate primeCordinate = Cordinate(3, 22);

  MinoLocation({required this.currentLocation, required TetroMino minoType})
      : placement = MinoPlacement(minoType);

  void _toRight() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.toRight());
    primeTmp.toRight();

    if (PlacedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _toLeft() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.toLeft());
    primeTmp.toLeft();

    if (PlacedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _down() {
    final List<Cordinate> tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;
    tmp.forEach((c) => c.down());
    primeTmp.down();

    if (PlacedBlocks.doseOverlapWith(tmp)) {
      currentLocation = tmp;
      primeCordinate = primeTmp;
    }
  }

  void _hardDrop() {
    final List<Cordinate> fin = List<Cordinate>.from(currentLocation),
        tmp = List<Cordinate>.from(currentLocation);
    final Cordinate primeTmp = primeCordinate;

    while (true) {
      tmp.forEach((c) => c.down());
      if (PlacedBlocks.doseOverlapWith(tmp)) break;
      fin.forEach((c) => c.down());
      primeTmp.down();
    }

    currentLocation = fin;
    primeCordinate = primeTmp;

    // 設置
  }

  List<Cordinate> _parsePlacement(List<List<int>> placement) {
    int x = 0, y = 0;
    final List<Cordinate> parsed = [];

    placement.forEach((row) {
      row.forEach((block) {
        parsed.add(primeCordinate + Cordinate(x, -y));
        x++;
      });
      y++;
    });

    return parsed;
  }
}
