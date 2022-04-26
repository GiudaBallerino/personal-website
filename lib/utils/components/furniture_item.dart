import 'package:flutter/material.dart';
import 'package:personal_website/models/widget_furniture.dart';

import '../constant.dart';

class FurnitureItem extends StatelessWidget {
  const FurnitureItem({
    Key? key,
    required this.furniture,
  }) : super(key: key);
  final WidgetFurniture furniture;

  @override
  Widget build(BuildContext context) {
    return Draggable<WidgetFurniture>(
      feedback: _feedback,
      data: furniture,
      childWhenDragging: _childWhileDragging,
      onDragStarted: () {},
      onDragCompleted: () {},
      onDraggableCanceled: (velocity, offset) {},
      child: _childWhileDragging,
    );
  }

  Widget get _feedback {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: kDisabledColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(
            furniture.icon,
            size: 64,
            color: kDisabledColor,
          ),
          Text(
            furniture.type.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget get _childWhileDragging {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: kDisabledColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(
            furniture.icon,
            size: 64,
            color: kDisabledColor,
          ),
          Text(
            furniture.type.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
