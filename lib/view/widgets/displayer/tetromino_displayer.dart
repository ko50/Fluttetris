import 'package:flute_tris/game_info/common/cordinate.dart';
import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/game_info/render/block.dart';
import 'package:flute_tris/view/widgets/tetromino/tetris_block.dart';
import 'package:flutter/material.dart';

class TetroMinoDisplayer extends StatelessWidget {
  final TetroMino minoType;
  final double gridSize;
  final double scale;

  TetroMinoDisplayer({
    @required this.minoType,
    @required this.gridSize,
    @required this.scale,
  });

  List<TetrisBlock> _blocksFromPlacement() {
    if (minoType == null) return [];

    final List<Cordinate> cordinates = [];

    minoType.previewPlacement.reversed
        .toList()
        .asMap()
        .forEach((y, row) => row.asMap().forEach(
              (x, block) {
                if (block != 0) cordinates.add(Cordinate(x, y));
              },
            ));

    return cordinates.map((c) {
      final Block block = Block(
        color: minoType?.color ?? Colors.grey[400],
        cordinate: c,
      );

      return TetrisBlock(
        cordinate: block.cordinate,
        color: block.color,
        gridSize: gridSize * scale,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: gridSize * 4 * scale + 4,
      height: gridSize * 3 * scale + 4,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        boxShadow: [BoxShadow()],
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(2.0),
          child: Stack(children: _blocksFromPlacement()),
        ),
      ),
    );
  }
}
