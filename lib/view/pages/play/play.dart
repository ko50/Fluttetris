import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flute_tris/game_info/enum/mino_type.dart';
import 'package:flute_tris/models/hold_model.dart';
import 'package:flute_tris/models/nexts_model.dart';
import 'package:flute_tris/models/operation_model.dart';
import 'package:flute_tris/models/placed_blocks_model.dart';
import 'package:flute_tris/view/widgets/displayer/disp_blocks.dart';
import 'package:flute_tris/view/widgets/displayer/disp_holded.dart';
import 'package:flute_tris/view/widgets/displayer/disp_nexts.dart';

class Play extends StatelessWidget {
  Widget _displays() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          HoldedMinoDisplayer(),
          BlockDisplayer(height: 21, width: 10),
          NextsDisplayer(),
        ],
      ),
    );
  }

  // Widget _operators() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Play")),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<HoldModel>(create: (_) => HoldModel()),
          ChangeNotifierProvider<NextsModel>(create: (_) => NextsModel()),
          ChangeNotifierProvider<PlacedBlocksModel>(
            create: (_) => PlacedBlocksModel(),
          ),
        ],
        child: ChangeNotifierProvider<OperationModel>(
          create: (_) {
            final TetroMino firstMino =
                Provider.of<NextsModel>(context, listen: false).nextMino;

            return OperationModel(firstMino);
          },
          child: Container(child: Column(children: [_displays()])),
        ),
      ),
    );
  }
}
