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
  List<WidgetFurniture> layout = [
    WidgetFurniture(
      type: WidgetType.row,
      icon: Icons.table_rows,
    ),
  ];
  List<WidgetFurniture> content = [
    WidgetFurniture(
      type: WidgetType.text,
      icon: Icons.text_fields,
    ),
    WidgetFurniture(
      type: WidgetType.image,
      icon: Icons.image,
    ),
  ];
}
