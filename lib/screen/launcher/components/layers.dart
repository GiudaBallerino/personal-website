import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_website/utils/constant.dart';

import '../../../models/image_setting.dart';

typedef void ReorderCallback(List<ImageSetting> list);
typedef void SelectionCallback(ImageSetting? img);
class Layers extends StatefulWidget {
  Layers({
    Key? key,
    required this.width,
    required this.height,
    required this.images,
    required this.onReorder,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  List<ImageSetting> images;
  ReorderCallback onReorder;
  SelectionCallback onTap;

  @override
  _LayersState createState() => _LayersState();
}

class _LayersState extends State<Layers> {
  ImageSetting? selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: kAltBackgroundColor,
      child: Column(
        children: [
          Text(
            "Livelli",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: ReorderableListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: widget.images.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  key: Key('$index'),
                  selected: selected == widget.images[index],
                  selectedColor: kPrimaryColor,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  leading: Image.asset(
                    widget.images[index].path,
                    fit: BoxFit.cover,
                    width: widget.width * 0.1,
                    height: widget.width * 0.1,
                  ),
                  title: Text('Livello $index',style: TextStyle(fontWeight: FontWeight.bold),),
                  onTap: () {
                    setState(() {
                      selected = widget.images[index];
                      // _widthController = TextEditingController(
                      //     text: widget.images[index].width.toString());
                      // _heightController = TextEditingController(
                      //     text: widget.images[index].height.toString());
                      // _opacityController = TextEditingController(
                      //     text: widget.images[index].opacity.toString());
                      // _rotationController = TextEditingController(
                      //     text: widget.images[index].opacity.toString());
                    });
                    widget.onTap(selected);
                  },
                );
              },
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final ImageSetting img = widget.images.removeAt(oldIndex);
                  widget.images.insert(newIndex, img);
                });
                widget.onReorder(widget.images);
              },
            ),
          ),
        ],
      ),
    );
  }
}
