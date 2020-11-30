import 'package:flutter/material.dart';

class BlockDisplayer extends StatelessWidget {
  final int height;
  final int width;
  final List<Widget> children;

  static const double gridSize = 30.0;

  BlockDisplayer({
    required this.height,
    required this.width,
    required this.children,
  });

  Widget _block() => Container(
        height: gridSize,
        width: gridSize,
        color: Colors.grey[400],
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.white),
        ),
      );

  Widget _background() {
    final List<Widget> row = List.filled(width, _block());
    final List<Row> rows = List.filled(height, Row(children: row));

    return Container(child: Column(children: rows));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * gridSize,
      width: width * gridSize,
      decoration: BoxDecoration(boxShadow: [BoxShadow()]),
      child: Stack(children: [_background()] + children),
    );
  }
}
