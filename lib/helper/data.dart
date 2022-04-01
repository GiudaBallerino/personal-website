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
          color: kBackgroundColor,
        )),
    Pages(
        id: "home-page",
        name: ".home()",
        route: "/home",
        type: PagesType.home,
        logo: const Icon(Icons.home, color: kBackgroundColor)),
  ];
}

