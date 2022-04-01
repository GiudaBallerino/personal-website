import 'dart:convert';
import 'dart:ui';
import 'dart:html' as html;
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:personal_website/utils/constant.dart';

typedef void SelectionCallback(String path);

class Drawer extends StatefulWidget {
  const Drawer({Key? key, required this.pathList, required this.selectedPaths,required this.onTap})
      : super(key: key);

  final List<String> pathList;
  final List<String> selectedPaths;
  final SelectionCallback onTap;

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // if (backgroundPath != null && landscapePath != null) {
    //   var idB = backgroundPath!.split("/").last.split(".").first;
    //   var idL = landscapePath!.split("/").last.split(".").first;
    //
    //   var extB = backgroundPath!.split("/").last.split(".").last;
    //   var extL = landscapePath!.split("/").last.split(".").last;
    //   html.window.open(
    //       'http://localhost:50481/art?idB=$idB&idL=$idL&extB=$extB&extL=$extL',
    //       '_blank');
    //   //Navigator.pushNamed(context, '/art?idB=$idB&idL=$idL&extB=$extB&extL=$extL');
    //   setState(() {
    //     backgroundPath = null;
    //     landscapePath = null;
    //   });
    // }
    return Container(
      width: (size.width * 0.85)-60,
      height: ((size.width * 0.85) / 5)*(widget.pathList.length/5).ceil(),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kDarkGradient, kLightGradient]),
      ),
      child: GridView.builder(
        itemCount: widget.pathList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: (size.width * 0.80) / 5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  border: widget.selectedPaths.contains(widget.pathList[index]) ? Border.all(color: kSecondaryColor,width: 5):null,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Image.asset(widget.pathList[index],fit: BoxFit.cover,),
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
