import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_website/models/color_pixel.dart';

class Painter extends CustomPainter {
  final List<ColorPixel> pixelList;

  Paint style = Paint()
    ..style = PaintingStyle.fill
    ..strokeWidth = 1;
  //paint0.shader = ui.Gradient.linear(Offset(size.width*0.42,size.height*0.46),Offset(size.width*0.63,size.height*0.46),[Color(0xff000000),Color(0xffffffff)],[0.00,1.00]);

  Painter({
    required this.pixelList,
  });

  @override
  void paint(Canvas canvas, Size size) {
    renderDrawing(canvas, size);
  }

  void renderDrawing(Canvas canvas, Size size) {
    Size sizeP = Size(100, (100 * 0.5833333333333334).toDouble());
    Random ran = Random();

    Path path0 = Path();
    path0.moveTo(sizeP.width * 0.4570000, sizeP.height * 0.4668571);
    path0.cubicTo(
        sizeP.width * 0.4295000,
        sizeP.height * 0.5043571,
        sizeP.width * 0.46816671,
        sizeP.height * 0.5083571,
        sizeP.width * 0.4203333,
        sizeP.height * 0.5168571);
    path0.quadraticBezierTo(sizeP.width * 0.3934583, sizeP.height * 0.5585714,
        sizeP.width * 0.4195000, sizeP.height * 0.5854286);
    path0.quadraticBezierTo(sizeP.width * 0.4752083, sizeP.height * 0.6115714,
        sizeP.width * 0.4760000, sizeP.height * 0.5517143);
    path0.cubicTo(
        sizeP.width * 0.4872917,
        sizeP.height * 0.5476429,
        sizeP.width * 0.5232083,
        sizeP.height * 0.4503571,
        sizeP.width * 0.5398333,
        sizeP.height * 0.4851429);
    path0.quadraticBezierTo(sizeP.width * 0.5890000, sizeP.height * 0.4619286,
        sizeP.width * 0.5845000, sizeP.height * 0.3968571);
    path0.quadraticBezierTo(sizeP.width * 0.7425417, sizeP.height * 0.2031429,
        sizeP.width * 0.5250000, sizeP.height * 0.4082857);
    path0.cubicTo(
        sizeP.width * 0.4673333,
        sizeP.height * 0.3886429,
        sizeP.width * 0.5076667,
        sizeP.height * 0.4777857,
        sizeP.width * 0.4570000,
        sizeP.height * 0.4668571);
    path0.close();

    Path path1 = Path();
    path1.moveTo(sizeP.width * 0.4536417, sizeP.height * 0.4985000);
    path1.quadraticBezierTo(sizeP.width * 0.4376250, sizeP.height * 0.5083286,
        sizeP.width * 0.4351667, sizeP.height * 0.4892429);
    path1.quadraticBezierTo(sizeP.width * 0.4198583, sizeP.height * 0.5032000,
        sizeP.width * 0.4329000, sizeP.height * 0.4527143);
    path1.quadraticBezierTo(sizeP.width * 0.4444167, sizeP.height * 0.4454143,
        sizeP.width * 0.4662083, sizeP.height * 0.4426857);
    path1.cubicTo(
        sizeP.width * 0.4618417,
        sizeP.height * 0.4441571,
        sizeP.width * 0.4728167,
        sizeP.height * 0.4179143,
        sizeP.width * 0.4772250,
        sizeP.height * 0.4416000);
    path1.cubicTo(
        sizeP.width * 0.4967500,
        sizeP.height * 0.4406429,
        sizeP.width * 0.5032667,
        sizeP.height * 0.4313571,
        sizeP.width * 0.5105917,
        sizeP.height * 0.4360714);
    path1.cubicTo(
        sizeP.width * 0.5160083,
        sizeP.height * 0.4216429,
        sizeP.width * 0.5466750,
        sizeP.height * 0.4363429,
        sizeP.width * 0.5566667,
        sizeP.height * 0.4271429);
    path1.quadraticBezierTo(sizeP.width * 0.5681417, sizeP.height * 0.4026714,
        sizeP.width * 0.5857917, sizeP.height * 0.4425429);
    path1.quadraticBezierTo(sizeP.width * 0.6285167, sizeP.height * 0.4730143,
        sizeP.width * 0.5963417, sizeP.height * 0.4762000);
    path1.quadraticBezierTo(sizeP.width * 0.5867500, sizeP.height * 0.5010714,
        sizeP.width * 0.5732250, sizeP.height * 0.4937714);
    path1.quadraticBezierTo(sizeP.width * 0.5274333, sizeP.height * 0.4875429,
        sizeP.width * 0.5121750, sizeP.height * 0.4854714);
    path1.quadraticBezierTo(sizeP.width * 0.5021917, sizeP.height * 0.4883857,
        sizeP.width * 0.4783333, sizeP.height * 0.4971429);
    path1.lineTo(sizeP.width * 0.4536417, sizeP.height * 0.4985000);
    path1.close();

    Path path2 = Path();
    path2.moveTo(sizeP.width * 0.3225000, sizeP.height * 0.3528571);
    path2.quadraticBezierTo(sizeP.width * 0.3235833, sizeP.height * 0.3677143,
        sizeP.width * 0.3275000, sizeP.height * 0.3757143);
    path2.cubicTo(
        sizeP.width * 0.3402083,
        sizeP.height * 0.3864286,
        sizeP.width * 0.3542917,
        sizeP.height * 0.3918571,
        sizeP.width * 0.3650000,
        sizeP.height * 0.3957143);
    path2.quadraticBezierTo(sizeP.width * 0.3810833, sizeP.height * 0.3905000,
        sizeP.width * 0.4400000, sizeP.height * 0.3885714);
    path2.quadraticBezierTo(sizeP.width * 0.4537917, sizeP.height * 0.3728571,
        sizeP.width * 0.4575000, sizeP.height * 0.3600000);
    path2.quadraticBezierTo(sizeP.width * 0.4593750, sizeP.height * 0.3502143,
        sizeP.width * 0.4516667, sizeP.height * 0.3300000);
    path2.quadraticBezierTo(sizeP.width * 0.4416667, sizeP.height * 0.3278571,
        sizeP.width * 0.4383333, sizeP.height * 0.3271429);
    path2.cubicTo(
        sizeP.width * 0.4318750,
        sizeP.height * 0.3089286,
        sizeP.width * 0.4116250,
        sizeP.height * 0.2999286,
        sizeP.width * 0.3991667,
        sizeP.height * 0.3000000);
    path2.quadraticBezierTo(sizeP.width * 0.3905417, sizeP.height * 0.3039286,
        sizeP.width * 0.3833333, sizeP.height * 0.3157143);
    path2.quadraticBezierTo(sizeP.width * 0.3365833, sizeP.height * 0.3035714,
        sizeP.width * 0.3210000, sizeP.height * 0.3162857);
    path2.quadraticBezierTo(sizeP.width * 0.3213750, sizeP.height * 0.3254286,
        sizeP.width * 0.3225000, sizeP.height * 0.3528571);
    path2.close();

    Path path3 = Path();
    path3.moveTo(sizeP.width * 0.2921917, sizeP.height * 0.5637286);
    path3.cubicTo(
        sizeP.width * 0.2867750,
        sizeP.height * 0.5812571,
        sizeP.width * 0.2744917,
        sizeP.height * 0.5841286,
        sizeP.width * 0.2663583,
        sizeP.height * 0.5794429);
    path3.cubicTo(
        sizeP.width * 0.2584333,
        sizeP.height * 0.5405857,
        sizeP.width * 0.2353250,
        sizeP.height * 0.5806000,
        sizeP.width * 0.2413583,
        sizeP.height * 0.5580143);
    path3.cubicTo(
        sizeP.width * 0.2539000,
        sizeP.height * 0.5249571,
        sizeP.width * 0.2360667,
        sizeP.height * 0.5143571,
        sizeP.width * 0.2380250,
        sizeP.height * 0.4908714);
    path3.cubicTo(
        sizeP.width * 0.2366167,
        sizeP.height * 0.4607714,
        sizeP.width * 0.2561333,
        sizeP.height * 0.4694857,
        sizeP.width * 0.2480250,
        sizeP.height * 0.4508714);
    path3.cubicTo(
        sizeP.width * 0.2502333,
        sizeP.height * 0.4163714,
        sizeP.width * 0.2451583,
        sizeP.height * 0.3770429,
        sizeP.width * 0.2680250,
        sizeP.height * 0.3894429);
    path3.cubicTo(
        sizeP.width * 0.2889833,
        sizeP.height * 0.4031000,
        sizeP.width * 0.2873500,
        sizeP.height * 0.3672429,
        sizeP.width * 0.3071917,
        sizeP.height * 0.3751571);
    path3.cubicTo(
        sizeP.width * 0.3210250,
        sizeP.height * 0.4032429,
        sizeP.width * 0.5200750,
        sizeP.height * 0.2096000,
        sizeP.width * 0.3513583,
        sizeP.height * 0.3994429);
    path3.cubicTo(
        sizeP.width * 0.3474583,
        sizeP.height * 0.4390143,
        sizeP.width * 0.3943917,
        sizeP.height * 0.4348714,
        sizeP.width * 0.3938583,
        sizeP.height * 0.4237286);
    path3.cubicTo(
        sizeP.width * 0.4591750,
        sizeP.height * 0.4380143,
        sizeP.width * 0.4357333,
        sizeP.height * 0.4665857,
        sizeP.width * 0.4496917,
        sizeP.height * 0.4808714);
    path3.cubicTo(
        sizeP.width * 0.4829917,
        sizeP.height * 0.5265429,
        sizeP.width * 0.5680167,
        sizeP.height * 0.3259857,
        sizeP.width * 0.4980250,
        sizeP.height * 0.5065857);
    path3.cubicTo(
        sizeP.width * 0.4872000,
        sizeP.height * 0.5318000,
        sizeP.width * 0.5247333,
        sizeP.height * 0.4999571,
        sizeP.width * 0.5395917,
        sizeP.height * 0.5261429);
    path3.cubicTo(
        sizeP.width * 0.5647750,
        sizeP.height * 0.4729286,
        sizeP.width * 0.5908250,
        sizeP.height * 0.5160286,
        sizeP.width * 0.6129667,
        sizeP.height * 0.4779143);
    path3.quadraticBezierTo(sizeP.width * 0.2977667, sizeP.height * 0.0701000,
        sizeP.width * 0.6613583, sizeP.height * 0.4565857);
    path3.quadraticBezierTo(sizeP.width * 0.6761833, sizeP.height * 0.4855143,
        sizeP.width * 0.6988583, sizeP.height * 0.4137286);
    path3.cubicTo(
        sizeP.width * 0.7131583,
        sizeP.height * 0.3788571,
        sizeP.width * 0.7232333,
        sizeP.height * 0.4019429,
        sizeP.width * 0.7313583,
        sizeP.height * 0.3980143);
    path3.cubicTo(
        sizeP.width * 0.7507417,
        sizeP.height * 0.4483143,
        sizeP.width * 0.7496083,
        sizeP.height * 0.3836143,
        sizeP.width * 0.7746917,
        sizeP.height * 0.4265857);
    path3.cubicTo(
        sizeP.width * 0.8152833,
        sizeP.height * 0.4250857,
        sizeP.width * 0.7957667,
        sizeP.height * 0.5149143,
        sizeP.width * 0.7760333,
        sizeP.height * 0.4792143);
    path3.cubicTo(
        sizeP.width * 0.7368667,
        sizeP.height * 0.4879143,
        sizeP.width * 0.7541250,
        sizeP.height * 0.5321857,
        sizeP.width * 0.7271917,
        sizeP.height * 0.4651571);
    path3.cubicTo(
        sizeP.width * 0.7139917,
        sizeP.height * 0.4318857,
        sizeP.width * 0.7046917,
        sizeP.height * 0.4801571,
        sizeP.width * 0.6971917,
        sizeP.height * 0.4851571);
    path3.cubicTo(
        sizeP.width * 0.6896917,
        sizeP.height * 0.4933714,
        sizeP.width * 0.6925667,
        sizeP.height * 0.5825286,
        sizeP.width * 0.6671917,
        sizeP.height * 0.5180143);
    path3.cubicTo(
        sizeP.width * 0.6568250,
        sizeP.height * 0.4756286,
        sizeP.width * 0.6339917,
        sizeP.height * 0.5669714,
        sizeP.width * 0.6100833,
        sizeP.height * 0.5360714);
    path3.cubicTo(
        sizeP.width * 0.5990500,
        sizeP.height * 0.5672429,
        sizeP.width * 0.5686083,
        sizeP.height * 0.5885143,
        sizeP.width * 0.5363583,
        sizeP.height * 0.5651571);
    path3.cubicTo(
        sizeP.width * 0.5227417,
        sizeP.height * 0.6024571,
        sizeP.width * 0.5139333,
        sizeP.height * 0.5564571,
        sizeP.width * 0.4863583,
        sizeP.height * 0.5880143);
    path3.cubicTo(
        sizeP.width * 0.4633667,
        sizeP.height * 0.5787286,
        sizeP.width * 0.4849417,
        sizeP.height * 0.5448429,
        sizeP.width * 0.4546917,
        sizeP.height * 0.5508714);
    path3.cubicTo(
        sizeP.width * 0.4307417,
        sizeP.height * 0.5685000,
        sizeP.width * 0.4559833,
        sizeP.height * 0.5099571,
        sizeP.width * 0.4080250,
        sizeP.height * 0.5180143);
    path3.cubicTo(
        sizeP.width * 0.3669250,
        sizeP.height * 0.5538429,
        sizeP.width * 0.4008500,
        sizeP.height * 0.4771857,
        sizeP.width * 0.3463583,
        sizeP.height * 0.4699571);
    path3.cubicTo(
        sizeP.width * 0.3351667,
        sizeP.height * 0.6195429,
        sizeP.width * 0.3239500,
        sizeP.height * 0.4035000,
        sizeP.width * 0.3105250,
        sizeP.height * 0.4451571);
    path3.cubicTo(
        sizeP.width * 0.3272333,
        sizeP.height * 0.5029286,
        sizeP.width * 0.2942083,
        sizeP.height * 0.4165143,
        sizeP.width * 0.2880250,
        sizeP.height * 0.4580143);
    path3.cubicTo(
        sizeP.width * 0.3368167,
        sizeP.height * 0.4990143,
        sizeP.width * 0.2641083,
        sizeP.height * 0.4804714,
        sizeP.width * 0.2821917,
        sizeP.height * 0.4994429);
    path3.cubicTo(
        sizeP.width * 0.2511917,
        sizeP.height * 0.5260429,
        sizeP.width * 0.2980917,
        sizeP.height * 0.5471000,
        sizeP.width * 0.2921917,
        sizeP.height * 0.5637286);
    path3.close();

    List<Path> pathList = [path0, path1, path2, path3];

    pixelList.forEach((pixel) {
      canvas.drawPath(
          pathList[ran.nextInt(3)].shift(Offset(
              pixel.x.toDouble() - (sizeP.width * 0.4570000),
              pixel.y.toDouble() - (sizeP.height * 0.4668571))),
          style..color = pixel.color);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
