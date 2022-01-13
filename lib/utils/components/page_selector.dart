import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_website/utils/components/sycontainer.dart';
import 'package:personal_website/utils/models/page.dart';

import '../constant.dart';

typedef void SelectionCallback(Pages page);
class PageSelector extends StatefulWidget {
  PageSelector({
    Key? key,
    required this.pagesList,
    required this.onPageChanged,

    required this.containerHeight,
    required this.containerWidth,
    required this.margin,
    required this.borderRadius,
  }) : super(key: key);

  List<Pages> pagesList;
  final SelectionCallback onPageChanged;

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
      children:
          List<GestureDetector>.generate(widget.pagesList.length, (index) {
        return GestureDetector(
            child: SyContainer(
              width: widget.containerWidth,
              height: widget.containerHeight,
              margin: widget.margin,
              borderRadius: widget.borderRadius,
              //emboss: index == pageList.length~/2,
              emboss: index==1,
              child: widget.pagesList[index].logo,
            ),
            onTap: () {
              setState(() {
                widget.onPageChanged(widget.pagesList[index]);
              });
            });
      }),
    );
  }
}


