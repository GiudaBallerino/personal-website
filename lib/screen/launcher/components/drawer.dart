import 'dart:convert';
import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:personal_website/utils/constant.dart';

typedef void SelectionCallback(String path);

class Drawer extends StatefulWidget {
  const Drawer(
      {Key? key,
      required this.width,
      required this.height,
      required this.pathList,
      required this.selectedPaths,
      required this.onTap})
      : super(key: key);

  final double width;
  final double height;
  final List<String> pathList;
  final List<String> selectedPaths;
  final SelectionCallback onTap;

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: kAltBackgroundColor,
      child: GridView.builder(
        itemCount: widget.pathList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  border: widget.selectedPaths.contains(widget.pathList[index])
                      ? Border.all(color: kPrimaryColor, width: 5)
                      : null,
                ),
                child: Image.asset(
                  widget.pathList[index],
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                widget.onTap(widget.pathList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
