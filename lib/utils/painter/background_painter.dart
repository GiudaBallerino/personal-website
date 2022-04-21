import 'package:flutter/material.dart';
import 'package:personal_website/utils/constant.dart';

/*
Application use
 Widget _circularBackground() {
    return new Container(
      height: double.infinity,
      width: double.infinity,
      child: new CustomPaint(
        painter: new CircularBackgroundPainter(),
      ),
    );
  }
*/

class CircularBackgroundPainter extends CustomPainter {
  final Paint mainPaint;

  CircularBackgroundPainter()
      : mainPaint = new Paint(){
    mainPaint.color = kAltBackgroundColor;
    mainPaint.isAntiAlias = true;
    mainPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    //canvas.translate(radius, radius);

    drawBellAndLeg(radius, canvas, size);

    canvas.restore();
  }

  void drawBellAndLeg(radius, canvas, Size size) {
    Path lowerPath = Path();
    //lowerPath.addRect(Rect.fromLTRB((size.width *0.2)+(size.height * 0.07), size.height * 0.008, size.width-size.width *0.2, size.height-size.height * 0.008));
    lowerPath.addOval(Rect.fromCircle(
      center: Offset((size.width*0.5)+(size.height*0.035),size.height*0.5),
      radius: size.width*0.5,
    ));



    canvas.drawPath(lowerPath, mainPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}