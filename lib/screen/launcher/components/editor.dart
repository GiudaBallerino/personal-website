import 'package:flutter/material.dart';
import 'package:personal_website/utils/constant.dart';

import '../../../models/image_setting.dart';

typedef void WidthCallback(double width);
typedef void HeightCallback(double height);
typedef void OpacityCallback(double opacity);
typedef void RotationCallback(double rotation);

class Editor extends StatefulWidget {
  Editor({
    Key? key,
    required this.width,
    required this.height,
    required this.widthController,
    required this.heightController,
    required this.opacityController,
    required this.rotationController,
    required this.onWidthChange,
    required this.onHeightChange,
    required this.onOpacityChange,
    required this.onRotationChange,
  }) : super(key: key);

  final double width;
  final double height;

  TextEditingController widthController;
  TextEditingController heightController;
  TextEditingController opacityController;
  TextEditingController rotationController;

  WidthCallback onWidthChange;
  HeightCallback onHeightChange;
  OpacityCallback onOpacityChange;
  RotationCallback onRotationChange;
  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Flexible(
                child: Container(
                  child: TextFormField(
                    controller: widget.widthController,
                    decoration: InputDecoration(
                      fillColor: kBackgroundColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'width',
                    ),
                    onFieldSubmitted: (width) {
                      widget.onWidthChange(double.parse(width));
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('X'),
              ),
              Flexible(
                child: Container(
                  child: TextFormField(
                    controller: widget.heightController,
                    decoration: InputDecoration(
                      fillColor: kBackgroundColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'height',
                    ),
                    onFieldSubmitted: (height) {
                      setState(
                        () {
                          widget.onHeightChange(double.parse(height));
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Flexible(
              child: Container(
                child: TextFormField(
                  controller: widget.opacityController,
                  decoration: InputDecoration(
                    fillColor: kBackgroundColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'opacity (max. 100)',
                  ),
                  onFieldSubmitted: (opacity) {
                    setState(
                      () {
                        if (double.parse(opacity) >= 0 && double.parse(opacity) <= 100) {
                          widget.onOpacityChange(double.parse(opacity));
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              child: TextFormField(
                controller: widget.rotationController,
                decoration: InputDecoration(
                  fillColor: kBackgroundColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'rotation',
                ),
                onFieldSubmitted: (rotation) {
                  setState(
                    () {
                      widget.onRotationChange(double.parse(rotation));
                    },
                  );
                },
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
