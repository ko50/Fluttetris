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
    required this.minoType,
    required this.gridSize,
    required this.scale,
  });

  List<TetrisBlock> _blocksFromPlacement() {
    int x = 0, y = 0;
    final List<Cordinate> cordinates = [];

    minoType.defaultPlacement.forEach((row) {
      row.forEach((block) {
        cordinates.add(Cordinate(x, -y));
        x++;
      });
      y++;
    });

    return cordinates.map((c) {
      final Block block = Block(color: minoType.color, cordinate: c);
      return TetrisBlock(block: block, gridSize: gridSize);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: gridSize * 4 * scale + 4,
      height: gridSize * 3 * scale + 4,
      decoration: BoxDecoration(
        color: Colors.grey,
        boxShadow: [BoxShadow()],
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(2.0),
          child: Stack(
            children: _blocksFromPlacement(),
          ),
        ),
      ),
    );
  }
}
