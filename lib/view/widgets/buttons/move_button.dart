import 'package:flute_tris/game_info/enum/move_direction.dart';
import 'package:flute_tris/models/operation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoveButton extends StatelessWidget {
  final void Function() onPressed;
  final MoveDirection moveDirection;

  MoveButton({
    @required this.onPressed,
    @required this.moveDirection,
  });

  @override
  Widget build(BuildContext context) {
    final OperationModel operationModel = context.read<OperationModel>();

    return RotatedBox(
      quarterTurns: moveDirection.index,
      child: Container(
        height: 40,
        width: 90,
        child: RaisedButton(
          onPressed: () => operationModel.move(moveDirection),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(width: 2.0, color: Colors.black),
          ),
          color: Colors.white,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.chevron_left),
          ),
        ),
      ),
    );
  }
}
