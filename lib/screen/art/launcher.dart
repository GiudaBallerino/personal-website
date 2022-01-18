import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/utils/components/page_selector.dart';
import 'package:personal_website/utils/components/side_menu.dart';
import 'package:personal_website/utils/components/side_menu_controller.dart';

import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/utils/models/page.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  List<String> imagePaths = [];
  String? selectedPath;
  Uint8List? data;
  final SideMenuController sideController = SideMenuController();

  List<Pages> list = [
    Pages(
        id: "home-page",
        name: ".home()",
        route: "/home",
        type: PagesType.home,
        logo: const Icon(Icons.home, color: kTextColor)),
    Pages(
        id: "art",
        name: ".art()",
        route: "/launch",
        type: PagesType.impress,
        logo: const Icon(
          Icons.brush,
          color: kTextColor,
        )),
  ];

  void navTo(Pages update) {
      Navigator.pushNamed(context,update.route);
  }

  @override
  void initState() {
    _initImages();
    super.initState();
  }

  Future _initImages() async {
    final Map<String, dynamic> assets =
        jsonDecode(await rootBundle.loadString('AssetManifest.json'));

    setState(() {
      imagePaths = assets.keys
          .where((String key) => key.contains('assets/'))
          .where((String key) => key.contains('img/'))
          .where((String key) => key.contains('.jpg'))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double itemHeight = (size.height * 0.6) / 4;
    double itemWidth = (size.width * 0.6) / 4;

    if (selectedPath != null) {
      var id = selectedPath!.split("/").last.split(".").first;
      html.window.open('http://pesarin.altervista.org/art?id=$id', '_blank');
      setState(() {
        selectedPath = null;
      });
    }
    return Stack(
      fit: StackFit.loose,
      children: [
        GestureDetector(
          onTap: () {
            sideController.close();
          },
          child: Container(
            color: kBackgroundColor,
            width: size.width,
            height: size.height,
            child: Center(
              child: Container(
                height: size.height * 0.6,
                width: size.width * 0.6,
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: kDarkShadow,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(3, 3),
                    ),
                    BoxShadow(
                      color: kLightShadow,
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(-3, -3),
                    ),
                  ],
                ),
                child: GridView.builder(
                  itemCount: imagePaths.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (context, index) => MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(size.width * 0.01),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          boxShadow: const [
                            BoxShadow(
                              color: kDarkShadow,
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(-3, -3),
                            ),
                            BoxShadow(
                              color: kLightShadow,
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(3, 3),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(imagePaths[index]),
                            fit: BoxFit.cover,
                            scale: 10.0,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(
                          () {
                            selectedPath = imagePaths[index];
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SideMenu(
          controller: sideController,
          initWidth: size.height * 0.07,
          initHeight: size.height * 0.07,
          initColor: kBackgroundColor,
          initBorderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(30),
          ),
          initListBoxShadow: [
            BoxShadow(
              color: kDarkShadow,
              blurRadius: (size.height * 0.07) / 10,
              offset:
              Offset((size.height * 0.07) / 10, (size.height * 0.07) / 10),
            ),
            BoxShadow(
              color: kLightShadow,
              blurRadius: (size.height * 0.07) / 10,
              offset: Offset(
                  -(size.height * 0.07) / 10, -(size.height * 0.07) / 10),
            ),
          ],
          initGradient: const LinearGradient(
              stops: [0, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kDarkGradient, kLightGradient]),
          //initChild: selectedPage.logo,
          initChild: list[1].logo,
          finalWidth: size.height * 0.07,
          finalHeight: size.height,
          finalColor: kBackgroundColor,
          finalBorderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(0),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(30),
          ),
          finalChild: PageSelector(
            pagesList: list,
            containerHeight: size.height * 0.05,
            containerWidth: size.height * 0.05,
            margin: EdgeInsets.only(
                left: size.width * 0.0025, top: size.height * 0.01),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            onPageChanged: navTo,
          ),
          duration: const Duration(milliseconds: 700),
          childDuration: const Duration(milliseconds: 500),
          childReverseDuration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
