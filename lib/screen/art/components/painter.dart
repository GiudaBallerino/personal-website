import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_website/utils/models/color_pixel.dart';

class Painter extends CustomPainter {
  final List<ColorPixel> pixelList;

  Painter({
    required this.pixelList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    renderDrawing(canvas, size);
  }

  void renderDrawing(Canvas canvas, Size size) {
    canvas.drawPaint(Paint()..color = Colors.white);
    Random rand = Random();

    pixelList.forEach((pixel) {
      var rx=(rand.nextInt(10).toDouble()/10)< 0.7 ? 25.0 : 7.0;
      var ry= rx == 7.0 ? 25.0 : 7.0;

      canvas.drawOval(//todo creare un oggetto
        Rect.fromLTWH(pixel.x as double, pixel.y as double,rx,ry),
        Paint()..color=pixel.color,
      );
    });

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
