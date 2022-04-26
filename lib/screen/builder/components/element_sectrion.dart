import 'package:flutter/material.dart';
import 'package:personal_website/helper/data.dart';
import 'package:personal_website/models/widget_furniture.dart';
import 'package:personal_website/utils/components/furniture_item.dart';

import '../../../utils/constant.dart';

class ElementSection extends StatelessWidget {
  const ElementSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Layout Element",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (WidgetFurniture widget in Furniture().list)
                  FurnitureItem(furniture: widget),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
