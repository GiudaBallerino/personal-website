import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_website/utils/models/page.dart';

import '../../helper/data.dart';
import '../constant.dart';

typedef void SelectionCallback(Pages page);
class PageSelector extends StatefulWidget {
  PageSelector({
    Key? key,
    required this.onTap,

    required this.containerHeight,
    required this.containerWidth,
    required this.margin,
    required this.borderRadius,
  }) : super(key: key);

  final SelectionCallback onTap;

  final double containerHeight;
  final double containerWidth;
  final EdgeInsets margin;
  final BorderRadiusGeometry borderRadius;

  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:
          List<MouseRegion>.generate(PagesData().list.length, (index) {
        return MouseRegion(
            cursor: SystemMouseCursors.click,
            child:GestureDetector(
            child: Container(
              width: widget.containerWidth,
              height: widget.containerHeight,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child:Text(
                PagesData().list[index].name,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            onTap: () {
              setState(() {
                widget.onTap(PagesData().list[index]);
              });
            }),);
      }),
    );
  }
}


