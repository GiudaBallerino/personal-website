import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/utils/models/color_pixel.dart';
import 'loading.dart';
import 'painter.dart';
import 'package:image/image.dart' as img;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? path = 'assets/img/' + (Uri.base.queryParameters['id']).toString() + '.jpg';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    late img.Image photo;

    void setImageBytes(imageBytes) {
      List<int> values = imageBytes.buffer.asUint8List();
      photo = img.decodeImage(values)!;
      photo = img.copyResize(photo,
          height: size.height.toInt(), width: size.width.toInt());
    }

    int abgrToArgb(int argbColor) {
      int r = (argbColor >> 16) & 0xFF;
      int b = argbColor & 0xFF;
      return (argbColor & 0xFF00FF00) | (b << 16) | r;
    }

    Color getColor(int x, int y) {
      int pixel32 = photo.getPixelSafe(x, y);
      int hex = abgrToArgb(pixel32);
      return Color(hex);
    }

    Future<List<ColorPixel>> _getPixelList() async {
      Uint8List? data = null;
      List<ColorPixel> pixelColorList = [];

      data = (await rootBundle.load(path!)).buffer.asUint8List();

      setImageBytes(data);
      Random rand = Random();
      var pX;
      var pY;
      for (int i = 0; i <= 100000; i++) {
        pX = rand.nextInt(size.width.toInt());
        pY = rand.nextInt(size.height.toInt());
        pixelColorList.add(ColorPixel(color: getColor(pX, pY), x: pX, y: pY));
      }
      return pixelColorList;
    }

    return FutureBuilder(
        future: _getPixelList(),
        builder: (_, AsyncSnapshot<List<ColorPixel>> data) {
          if (data.connectionState == ConnectionState.done) {
            print(data.data);
            return Container(
              width: size.width,
              height: size.height,
              child: CustomPaint(
                painter: Painter(pixelList: data.data!),
                child: Container(),
              ),
            );
          }
          return Loading();
        });
  }
}
