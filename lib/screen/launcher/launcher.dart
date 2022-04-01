import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/screen/launcher/component/drawer.dart';
import 'package:personal_website/utils/components/page_selector.dart';
import 'package:personal_website/utils/components/side_menu.dart';
import 'package:personal_website/utils/components/side_menu_controller.dart';

import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/utils/models/page.dart';
import 'package:personal_website/screen/launcher/component/drawer.dart'
    as component;

import '../../helper/data.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  List<String> imagePaths = [];
  List<String> selectedPaths = [];
  String selected = '';
  final SideMenuController sideController = SideMenuController();
  List<IconData> icons = [Icons.wallpaper, Icons.landscape, Icons.fireplace];

  @override
  void initState() {
    _initImages();
    super.initState();
  }

  Future _initImages() async {
    final Map<String, dynamic> assets =
        jsonDecode(await rootBundle.loadString('AssetManifest.json'));

    List<String> backgroundPaths = assets.keys
        .where((String key) => key.contains('assets/'))
        .where((String key) => key.contains('img/'))
        .where((String key) => key.contains('background/'))
        .where((String key) => key.contains('.jpg') || key.contains('.png'))
        .toList();
    List<String> landscapePaths = assets.keys
        .where((String key) => key.contains('assets/'))
        .where((String key) => key.contains('img/'))
        .where((String key) => key.contains('landscape/'))
        .where((String key) => key.contains('.jpg') || key.contains('.png'))
        .toList();

    setState(() {
      imagePaths = backgroundPaths + landscapePaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String getPlatform() {
      switch (size.height > size.width) {
        case true:
          return 'MOBILE'; //mobile
        case false:
          if (size.width / size.height < 1.5)
            return 'HALF'; //half
          else
            return 'FULL'; //full
        default:
          return 'FULL';
      }
    }

    // if (selectedPath != null) {
    //   var id = selectedPath!.split("/").last.split(".").first;
    //   var ext = selectedPath!.split("/").last.split(".").last;
    //   html.window.open('http://localhost:54541/art?id=$id&ext=$ext', '_blank');
    //   setState(() {
    //     selectedPath = null;
    //   });
    // }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            PagesData().list[0].name,
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
        GestureDetector(
          onTap: () {
            sideController.close();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Container(
                    width: (size.width * 0.85) - 60,
                    height: (size.width * 0.30),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                          stops: [0, 1],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [kDarkGradient, kLightGradient]),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: (size.width * 0.30) - 20,
                          height: (size.width * 0.30) - 20,
                          decoration: BoxDecoration(
                            border: selectedPaths.isEmpty
                                ? Border.all(color: kTertiaryColor, width: 5)
                                : null,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: selectedPaths.isEmpty
                              ? Center(
                                  child: Text('Seleziona un immagine'),
                                )
                              : Stack(
                                  children: [
                                    for (String path in selectedPaths)
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        child: Image.asset(
                                          path,
                                          fit: BoxFit.cover,
                                          width: (size.width * 0.30) - 20,
                                          height: (size.width * 0.30) - 20,
                                        ),
                                      ),
                                  ],
                                ),
                        ),
                        Container(
                          width: (((size.width * 0.85) - 60) -
                                  (size.width * 0.30)) -
                              20,
                          height: (size.width * 0.30) - 20,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: GridView.builder(
                            itemCount: selectedPaths.length,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: ((((size.width * 0.85) - 60) -
                                          (size.width * 0.30)) -
                                      20) /
                                  5,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Expanded(
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                selected == selectedPaths[index]
                                                    ? Border.all(
                                                        color: kTertiaryColor,
                                                        width: 5)
                                                    : null,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(30)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  selectedPaths[index]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selected = selectedPaths[index];
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  if(selected == selectedPaths[index])
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          setState(() {
                                            selectedPaths.remove(selected);
                                            selectedPaths.insert(index-1, selected);
                                          });
                                        },
                                        child: Icon(Icons.arrow_back_ios),
                                      ),
                                      InkWell(
                                        onTap:(){
                                          setState(() {
                                            selectedPaths.remove(selected);
                                            selected='';
                                          });
                                        },
                                        child: Icon(Icons.clear),
                                      ),
                                      InkWell(onTap:(){
                                        setState(() {
                                          selectedPaths.remove(selected);
                                          selectedPaths.insert(index+1, selected);
                                        });
                                      },
                                        child: Icon(Icons.arrow_forward_ios),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: component.Drawer(
                      pathList: imagePaths,
                      selectedPaths: selectedPaths,
                      onTap: (path) {
                        setState(() {
                          selectedPaths.contains(path)
                              ? selectedPaths.remove(path)
                              : selectedPaths.add(path);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
