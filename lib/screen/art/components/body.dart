import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/utils/models/color_pixel.dart';
import 'package:personal_website/utils/services/images_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loading.dart';
import 'painter.dart';
import 'package:image/image.dart' as img;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  Future<List<ColorPixel>> getPixelList(Size size) async {
    final prefs = await SharedPreferences.getInstance();
    Uint8List bytes = Base64Decoder().convert(prefs.getString('genImg')!);
    img.Image image = img.decodeImage(bytes)!;

    image = ImageService().scaleImageCentered(image, size.width, size.height);

    return ImageService().getPixelList(image, size.width, size.height);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<List<ColorPixel>>(
      future: getPixelList(size),
      builder: (_, AsyncSnapshot<List<ColorPixel>> data) {
        if (data.connectionState == ConnectionState.waiting ||
            data.connectionState == ConnectionState.none) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Container(
              // width: size.width,
              // height: size.height,
              child: CustomPaint(
                painter: Painter(pixelList: data.data!),
                child: Container(),
              ),
            ),
          );
        }
      },
    );
  }
}
