import 'package:flutter/material.dart';

import '../utils/painter/background_painter.dart';

class Layout extends StatelessWidget {
  Widget? child;
  Layout({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: CircularBackgroundPainter(),
          child: child,
        ),
      )
    );
  }
}