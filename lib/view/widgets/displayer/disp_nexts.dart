import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/models/nexts_model.dart';
import 'package:flute_tris/view/widgets/displayer/tetromino_displayer.dart';

class NextsDisplayer extends StatelessWidget {
  Widget _recent(TetroMino mino) => Flexible(
        child: TetroMinoDisplayer(
          minoType: mino,
          gridSize: 16,
          scale: 1,
        ),
      );

  Widget _sub(TetroMino mino) => Flexible(
        child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: TetroMinoDisplayer(
              minoType: mino,
              gridSize: 16,
              scale: 0.8,
            )),
      );

  List<Widget> _displayers(List<TetroMino> nexts) {
    final List<Widget> displayers = [];

    displayers.add(_recent(nexts.first));
    displayers.addAll(nexts.sublist(1, 5).map((mino) => _sub(mino)).toList());

    return displayers;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, NextsModel nextsModel, _) {
        final List<TetroMino> nextMinos = nextsModel.nexts;

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _displayers(nextMinos),
          ),
        );
      },
    );
  }
}
