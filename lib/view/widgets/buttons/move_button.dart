import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/models/operation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoveButton extends StatelessWidget {
  final MoveDirection moveDirection;

  MoveButton({@required this.moveDirection});

  static Widget unit() {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 2.0,
            height: 50,
            width: 95,
            child: MoveButton(moveDirection: MoveDirection.Left),
          ),
          Positioned(
            top: 2.0,
            height: 95,
            child: MoveButton(moveDirection: MoveDirection.Up),
          ),
          Positioned(
            right: 2.0,
            height: 50,
            width: 95,
            child: MoveButton(moveDirection: MoveDirection.Right),
          ),
          Positioned(
            bottom: 2.0,
            height: 95,
            child: MoveButton(moveDirection: MoveDirection.Down),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, OperationModel operationModel, _) {
        return RotatedBox(
          quarterTurns: moveDirection.index,
          child: Container(
            height: 50,
            width: 100,
            child: RaisedButton(
              elevation: 0,
              focusElevation: 0,
              hoverElevation: 0,
              highlightElevation: 0,
              onPressed: () => operationModel.move(moveDirection),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(width: 2.0, color: Colors.grey[400]),
              ),
              color: Colors.white,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.chevron_left),
              ),
            ),
          ),
        );
      },
    );
  }
}
