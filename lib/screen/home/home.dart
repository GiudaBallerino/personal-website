import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_website/helper/data.dart';
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
  final SideMenuController sideController = SideMenuController();

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
          initWidth: size.height * 0.15,
          initHeight: size.height * 0.07,
          initColor: kTextColor,
          initBorderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(30),
          ),
          initGradient: const LinearGradient(
              stops: [0, 1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kDarkGradient, kLightGradient]),
          //initChild: selectedPage.logo,
          initChild: Text(
            PagesData().list[1].name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          finalWidth: size.height * 0.15,
          finalHeight: size.height,
          finalColor: kTextColor,
          finalBorderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(0),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(30),
          ),
          finalChild: PageSelector(
            containerHeight: size.height * 0.05,
            containerWidth: size.height * 0.15,
            margin: EdgeInsets.only(
                left: size.width * 0.0025, top: size.height * 0.01),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            onTap: (page) => Navigator.pushNamed(context, page.route),
          ),
          duration: const Duration(milliseconds: 700),
          childDuration: const Duration(milliseconds: 500),
          childReverseDuration: const Duration(milliseconds: 500),
        ),
      ],
    );
  }
}
