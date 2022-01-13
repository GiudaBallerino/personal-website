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
  late Pages selectedPage;
  late List<Pages> list;

  final SideMenuController sideController = SideMenuController();

  @override
  void initState() {
    super.initState();
    selectedPage = pageList[1];
    list = pageList;
  }

  void updateSelector(Pages update) {
    setState(() {
      selectedPage = update;
      reorder();
      Navigator.pushNamed(context, selectedPage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        fit: StackFit.loose,
        children: [
        GestureDetector(
        onTap: (){
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
            initWidth: size.height * 0.06,
            initHeight: size.height * 0.06,
            initColor: kBackgroundColor,
            initBorderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(30),
            ),
            initListBoxShadow: const [
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
            //initChild: selectedPage.logo,
            initChild: list[1].logo,
            finalWidth: size.height * 0.06,
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
              onPageChanged: updateSelector,
            ),
            duration: const Duration(milliseconds: 800),
            childDuration: const Duration(milliseconds: 500),
            childReverseDuration: const Duration(milliseconds: 500),
          ),
        ],
    );
  }

  void reorder() {
    list.remove(selectedPage);
    //list.insert(list.length ~/ 2, selectedPage);
    list.insert(1, selectedPage);
  }
}
