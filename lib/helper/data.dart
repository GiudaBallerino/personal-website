import 'package:personal_website/models/widget_furniture.dart';

import '../utils/constant.dart';
import '../models/page.dart';
import 'package:flutter/material.dart';

class PagesData {
  List<Pages> list = [
    Pages(
        id: "art",
        name: ".art()",
        route: "/launch",
        type: PagesType.impress,
        logo: const Icon(
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

class ImageCategory {
  List<String> list = ['tutte', 'background', 'paesaggi', 'sticker'];
}

class Furniture {
  List<WidgetFurniture> list = [
    ContainerFurniture(
      type: WidgetType.container,
      icon: Icons.crop_din,
      selected: false,
      widget: Container(
        width: 100,
        height: 100,
      ),
    ),
    RowFurniture(
      type: WidgetType.row,
      icon: Icons.table_rows,
      selected: false,
      widget: Row(
        children: [],
      ),
    ),
  ];
}
