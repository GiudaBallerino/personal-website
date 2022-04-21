import '../utils/constant.dart';
import '../utils/models/page.dart';
import 'package:flutter/material.dart';

class PagesData{
  List<Pages> list = [
    Pages(
        id: "art",
        name: ".art()",
        route: "/launch",
        type: PagesType.impress,
        logo:const Icon(
          Icons.brush,
          color: kTextColor,
        )),
    Pages(
        id: "home-page",
        name: ".home()",
        route: "/home",
        type: PagesType.home,
        logo: const Icon(Icons.home, color: kTextColor)),
  ];
}
class ImageCategory{
  List<String> list=[
    'tutte',
    'background',
    'paesaggi',
    'sticker'
  ];
}

