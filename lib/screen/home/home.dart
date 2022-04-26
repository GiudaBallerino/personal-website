import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_website/helper/data.dart';
import 'package:personal_website/screen/home/components/body.dart' as home;
import 'package:personal_website/utils/components/page_selector.dart';
import 'package:personal_website/utils/components/side_menu.dart';
import 'package:personal_website/utils/components/side_menu_controller.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/models/page.dart';

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
            width: size.width,
            height: size.height,
            child: const home.Body(),
          ),
        ),
        SideMenu(
          controller: sideController,
          initWidth: size.height * 0.07,
          initHeight: size.height * 0.07,
          initColor: kAltBackgroundColor,
          initBorderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(10),
          ),
          initChild: PagesData().list[1].logo,
          finalWidth: size.height * 0.07,
          finalHeight: size.height * 0.2,
          finalColor: kAltBackgroundColor,
          finalBorderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(0),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(10),
          ),
          finalChild: PageSelector(
            containerHeight: size.height * 0.05,
            containerWidth: size.height * 0.15,
            margin: EdgeInsets.only(
                left: size.width * 0.0025, top: size.height * 0.01),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            onTap: (page) => Navigator.pushNamed(context, page.route),
          ),
          duration: const Duration(milliseconds: 200),
          childDuration: const Duration(milliseconds: 100),
          childReverseDuration: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
