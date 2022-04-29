import 'package:flutter/material.dart';

enum WidgetType {
  text,
  image,
  row,
}
class WidgetFurniture {
  WidgetFurniture({
    required this.type,
    required this.icon,
  });

  final WidgetType type;
  final IconData icon;
}
