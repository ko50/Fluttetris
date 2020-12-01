import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/models/hold_model.dart';
import 'package:flute_tris/view/widgets/displayer/tetromino_displayer.dart';

class HoldedMinoDisplayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TetroMino holdedMino = Provider.of<HoldModel>(context).holdedMino;

    return Container(
      child: TetroMinoDisplayer(
        minoType: holdedMino,
        gridSize: 18,
        scale: 1,
      ),
    );
  }
}
