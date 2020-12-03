import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/models/operation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RotateButton extends StatelessWidget {
  final RotateDirection rotateDirection;

  RotateButton({@required this.rotateDirection});

  @override
  Widget build(BuildContext context) {
    final OperationModel operationModel = context.read<OperationModel>();

    return Container(
      height: 50,
      width: 50,
      child: RaisedButton(
        onPressed: () => operationModel.rotate(rotateDirection),
        child: Icon(
          rotateDirection == RotateDirection.Left
              ? Icons.rotate_left
              : Icons.rotate_right,
        ),
      ),
    );
  }
}
