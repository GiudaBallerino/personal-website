import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/utils/models/color_pixel.dart';
import 'package:personal_website/utils/services/images_service.dart';
import 'loading.dart';
import 'painter.dart';
import 'package:image/image.dart' as img;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String backgroundPath =
      'assets/img/background/${Uri.base.queryParameters['idB']}.${Uri.base.queryParameters['extB']}';
  String landscapePath =
      'assets/img/landscape/${Uri.base.queryParameters['idL']}.${Uri.base.queryParameters['extL']}';

  Future<List<ColorPixel>> getPixelList(Size size) async {
    img.Image background = await ImageService().pathToImage(backgroundPath);
    img.Image landscape = await ImageService().pathToImage(landscapePath);

    background = ImageService().scaleImageCentered(
        background,
        max(background.width.toDouble(), landscape.width.toDouble()),
        max(background.height.toDouble(), landscape.height.toDouble()));
    landscape = ImageService().scaleImageCentered(
        landscape,
        max(background.width.toDouble(), landscape.width.toDouble()),
        max(background.height.toDouble(), landscape.height.toDouble()));
    img.Image merged = ImageService().scaleImageCentered(
        ImageService().mergeImage(background, landscape),
        size.width,
        size.height);

    return ImageService().getPixelList(merged, size.width, size.height);
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
