import 'package:flute_tris/game_info/enum/rotate_direction.dart';
import 'package:flute_tris/models/operation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RotateButton extends StatelessWidget {
  final RotateDirection rotateDirection;

  RotateButton({@required this.rotateDirection});

  static Widget unit() {
    return Container(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          Positioned(
            bottom: 32.0,
            left: 32.0,
            child: RotateButton(rotateDirection: RotateDirection.Left),
          ),
          Positioned(
            top: 32.0,
            right: 32.0,
            child: RotateButton(rotateDirection: RotateDirection.Right),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, OperationModel operationModel, _) {
        return Container(
          height: 70,
          width: 70,
          child: RaisedButton(
            elevation: 0,
            focusElevation: 0,
            hoverElevation: 0,
            highlightElevation: 0,
            onPressed: () => operationModel.rotate(rotateDirection),
            color: Colors.white,
            shape: CircleBorder(
              side: BorderSide(
                width: 2.0,
                color: Colors.grey[400],
              ),
            ),
            child: Icon(
              rotateDirection == RotateDirection.Left
                  ? Icons.rotate_left
                  : Icons.rotate_right,
            ),
          ),
        );
      },
    );
  }
}
