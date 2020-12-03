import 'package:flutter/material.dart';

class MoveButton extends StatelessWidget {
  final void Function() onPressed;
  final int quarterTurns;

  MoveButton({
    @required this.onPressed,
    this.quarterTurns = 0,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Container(
        height: 40,
        width: 90,
        child: RaisedButton(
          onPressed: () => onPressed(),
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
