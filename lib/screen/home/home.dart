import 'dart:html';

import 'package:flutter/material.dart';
import 'package:personal_website/screen/home/components/body.dart' as home;
import 'package:personal_website/utils/components/page_selector.dart';
import 'package:personal_website/utils/components/side_menu.dart';
import 'package:personal_website/utils/components/side_menu_controller.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/utils/models/page.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pages> list = [
    Pages(
        id: "art",
        name: ".art()",
        route: "/launch",
        type: PagesType.impress,
        logo: const Icon(
          Icons.brush,
          color: kTextColor,
        )),
    Pages(
        id: "home-page",
        name: ".home()",
        route: "/home",
        type: PagesType.home,
        logo: const Icon(Icons.home, color: kTextColor)),
  ];

  final SideMenuController sideController = SideMenuController();

  void navTo(Pages update) {
      Navigator.pushNamed(context,update.route);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            child: const home.Body(),
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
