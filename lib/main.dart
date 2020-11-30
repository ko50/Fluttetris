import 'package:flutter/material.dart';

import 'package:flute_tris/view/pages/play/play.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluTetris',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Play(), // TODO ホーム画面実装
    );
  }
}
