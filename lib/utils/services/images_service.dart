import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:image/image.dart' as img;

import '../models/color_pixel.dart';

class ImageService {
  Future pathToImage(String path) async {
    var byteData = await rootBundle.load(path);
    return img.decodeImage(byteData.buffer.asUint8List());
  }

  img.Image mergeImage(img.Image image1, img.Image image2) {
    img.Image mergedImage = img.Image(max(image1.width, image2.width), max(image1.height, image2.height));

    img.copyInto(mergedImage, image1);
    img.copyInto(mergedImage, image2,dstX: 0,dstY:0,blend: true);

    return mergedImage;
  }

  img.Image scaleImageCentered(img.Image source, double width, double height) {
    double imageRatio = source.width / source.height;
    double screenRatio = width / height;

    img.Image resized = screenRatio > imageRatio
        ? img.copyResize(source,
            width: source.width * height ~/ source.height,
            height: height.toInt())
        : img.copyResize(source,
            width: width.toInt(),
            height: source.height * width ~/ source.width);

    return img.drawImage(
        img.Image(width.toInt(), height.toInt()),
        resized,
        dstX: ((width.toInt() - resized.width) / 2).round(),
        dstY: (height.toInt() - resized.height).round());
  }
  int abgrToArgb(int argbColor) {
    int r = (argbColor >> 16) & 0xFF;
    int b = argbColor & 0xFF;
    return (argbColor & 0xFF00FF00) | (b << 16) | r;
  }

  Color getColor(img.Image image, int x, int y) {
    int pixel32 = image.getPixelSafe(x, y);
    int hex = abgrToArgb(pixel32);
    return Color(hex);
  }

  List<ColorPixel> getPixelList(img.Image image, double width, double height){
    List<ColorPixel> pixelColorList = [];

    for (int i = 0; i <= 150000; i++) {
      var pX = Random().nextInt(width.toInt());
      var pY = Random().nextInt(height.toInt());
      pixelColorList.add(ColorPixel(color: getColor(image,pX, pY), x: pX, y: pY));
    }
    return pixelColorList;
  }
}
