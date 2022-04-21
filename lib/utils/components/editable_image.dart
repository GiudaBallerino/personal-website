import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_website/utils/models/image_setting.dart';

class EditableImage extends StatelessWidget {
  EditableImage({Key? key, required this.onDragEnd, required this.image, required this.size})
      : super(key: key);

  final void Function(Offset) onDragEnd;
  ImageSetting image;
  Size size;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Transform.rotate(
        angle: image.rotation * (pi / 180),
        child: Opacity(
          opacity: image.opacity / 100,
          child: Image.asset(
            image.path,
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
        ),
      ),
      childWhenDragging: Container(),
      child: Transform.rotate(
        angle: image.rotation * (pi / 180),
        child: Opacity(
          opacity: image.opacity / 100,
          child: Image.asset(
            image.path,
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
        ),
      ),
      onDragEnd: (drag) {
        RenderBox renderBox = context.findRenderObject() as RenderBox;
        onDragEnd(renderBox.globalToLocal(drag.offset));
      },
    );
  }
}
