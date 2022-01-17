import 'package:flutter/material.dart';
import 'package:personal_website/utils/models/color_pixel.dart';

class Painter extends CustomPainter {
  final List<ColorPixel> pixelList;

  Paint style = Paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = 1;

  Painter({
    required this.pixelList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    renderDrawing(canvas, size);
  }

  void renderDrawing(Canvas canvas, Size size) {
    Size sizeP = Size(100, (100 * 0.5833333333333334).toDouble());

    Path path = Path();
    path.moveTo(sizeP.width * 0.4570000, sizeP.height * 0.4668571);
    path.cubicTo(
        sizeP.width * 0.4295000,
        sizeP.height * 0.5043571,
        sizeP.width * 0.4681667,
        sizeP.height * 0.5083571,
        sizeP.width * 0.4203333,
        sizeP.height * 0.5168571);
    path.quadraticBezierTo(sizeP.width * 0.3934583, sizeP.height * 0.5585714,
        sizeP.width * 0.4195000, sizeP.height * 0.5854286);
    path.quadraticBezierTo(sizeP.width * 0.4752083, sizeP.height * 0.6115714,
        sizeP.width * 0.4760000, sizeP.height * 0.5517143);
    path.cubicTo(
        sizeP.width * 0.4872917,
        sizeP.height * 0.5476429,
        sizeP.width * 0.5232083,
        sizeP.height * 0.4503571,
        sizeP.width * 0.5398333,
        sizeP.height * 0.4851429);
    path.quadraticBezierTo(sizeP.width * 0.5890000, sizeP.height * 0.4619286,
        sizeP.width * 0.5845000, sizeP.height * 0.3968571);
    path.quadraticBezierTo(sizeP.width * 0.7425417, sizeP.height * 0.2031429,
        sizeP.width * 0.5250000, sizeP.height * 0.4082857);
    path.cubicTo(
        sizeP.width * 0.4673333,
        sizeP.height * 0.3886429,
        sizeP.width * 0.5076667,
        sizeP.height * 0.4777857,
        sizeP.width * 0.4570000,
        sizeP.height * 0.4668571);
    path.close();

    pixelList.forEach((pixel) {
      canvas.drawPath(
          path.shift(Offset(pixel.x.toDouble() - (sizeP.width * 0.4570000),
              pixel.y.toDouble() - (sizeP.height * 0.4668571))),
          style..color = pixel.color);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
