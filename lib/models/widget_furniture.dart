import 'package:flutter/material.dart';

enum WidgetType {
  container,
  row,
}

abstract class WidgetFurniture {
  WidgetFurniture({
    required this.type,
    required this.selected,
    required this.icon,
    required this.id,
  });

  final WidgetType type;
  final IconData icon;
  bool selected;
  int id;

  Map<String, dynamic> toJson() => {};
}

class RowFurniture extends WidgetFurniture {
  RowFurniture({
    required WidgetType type,
    required bool selected,
    required IconData icon,
    required int id,
    required this.crossAxisAlignment,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
  }) : super(type: type, selected: selected, icon: icon, id:id);

  CrossAxisAlignment crossAxisAlignment;
  MainAxisAlignment  mainAxisAlignment;
  MainAxisSize mainAxisSize;


  Map<String, dynamic> toJson() => {
    'type': type.name,
    'id':id,
    'args': {
      'crossAxisAlignment':crossAxisAlignment.toString().split('.').last,
      'mainAxisAlignment':mainAxisAlignment.toString().split('.').last,
      'mainAxisSize':mainAxisSize.toString().split('.').last,
    },
    'children': []
  };
}

class ContainerFurniture extends WidgetFurniture {
  ContainerFurniture({
    required WidgetType type,
    required bool selected,
    required IconData icon,
    required int id,
    //this.alignment,
    //this.clipBehavior,
    required this.color,
    //this.constraints,
    //this.decoration,
    required this.height,
    //this.margin,
    //this.padding,
    //this.transform,
    required this.width,
  }) : super(type: type, selected: selected, icon: icon,id: id);

  // Alignment? alignment;
  // Clip? clipBehavior;
  Color color;
  //BoxConstraints? constraints;
  //BoxDecoration? decoration;
  double height;
  // EdgeInsets? margin;
  // EdgeInsets? padding;
  //Matrix4? transform;
  double width;

  Map<String, dynamic> toJson() => {
        'type': type.name,
        'id':id,
        'args': {
          'color': '#${(color.value - 4278190080).toRadixString(16)}',
          'height': height,
          'width': width,
        },
      };
}
