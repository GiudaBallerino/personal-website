import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:html' as html;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/screen/launcher/component/editor.dart';
import 'package:personal_website/screen/launcher/component/filter.dart';
import 'package:personal_website/screen/launcher/component/manager.dart';
import 'package:personal_website/screen/launcher/component/layers.dart';
import 'package:personal_website/utils/components/page_selector.dart';
import 'package:personal_website/utils/components/side_menu.dart';
import 'package:personal_website/utils/components/side_menu_controller.dart';

import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/screen/launcher/component/drawer.dart'
    as component;

import '../../helper/data.dart';
import '../../utils/models/image_setting.dart';

enum Mode {
  add,
  edit,
  none,
}

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  List<String> imagePaths = [];
  List<String> backgroundPaths = [];
  List<String> landscapePaths = [];
  List<String> stickerPaths = [];
  List<ImageSetting> images = [];
  ImageSetting? selected = null;
  final SideMenuController sideController = SideMenuController();
  String selectedCategory = 'tutte';
  Mode mode = Mode.none;

  @override
  void initState() {
    _initImages();
    super.initState();
  }

  Future _initImages() async {
    final Map<String, dynamic> assets =
        jsonDecode(await rootBundle.loadString('AssetManifest.json'));
    setState(() {
      backgroundPaths = assets.keys
          .where((String key) => key.contains('assets/'))
          .where((String key) => key.contains('img/'))
          .where((String key) => key.contains('background/'))
          .where((String key) => key.contains('.webp'))
          .toList();
    });

    setState(() {
      landscapePaths = assets.keys
          .where((String key) => key.contains('assets/'))
          .where((String key) => key.contains('img/'))
          .where((String key) => key.contains('landscape/'))
          .where((String key) => key.contains('.webp'))
          .toList();
    });
    setState(() {
      stickerPaths = assets.keys
          .where((String key) => key.contains('assets/'))
          .where((String key) => key.contains('img/'))
          .where((String key) => key.contains('sticker/'))
          .where((String key) => key.contains('.webp'))
          .toList();
    });

    setState(() {
      imagePaths = backgroundPaths + landscapePaths + stickerPaths;
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

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          // initGradient: const LinearGradient(
          //     stops: [0, 1],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [kDarkShadow, kLightShadow]),
          //initChild: selectedPage.logo,
          initChild: PagesData().list[0].logo,
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
        GestureDetector(
          onTap: () {
            sideController.close();
          },
          child: Stack(
            children: [
              if (selected != null && mode == Mode.edit)
                Positioned(
                  left: 0,
                  child: Editor(
                    width: size.width * 0.25,
                    height: size.height,
                    widthController:
                        TextEditingController(text: selected!.width.toString()),
                    heightController: TextEditingController(
                        text: selected!.height.toString()),
                    opacityController: TextEditingController(
                        text: selected!.opacity.toString()),
                    rotationController: TextEditingController(
                        text: selected!.rotation.toString()),
                    onWidthChange: (width) {
                      setState(() {
                        images[images.indexOf(selected!)].width = width;
                      });
                    },
                    onHeightChange: (height) {
                      setState(() {
                        images[images.indexOf(selected!)].height = height;
                      });
                    },
                    onOpacityChange: (opacity) {
                      setState(() {
                        images[images.indexOf(selected!)].opacity = opacity;
                      });
                    },
                    onRotationChange: (rotation) {
                      setState(() {
                        images[images.indexOf(selected!)].rotation = rotation;
                      });
                    },
                  ),
                )
              else if (mode == Mode.add)
                Positioned(
                  left: 0,
                  child: Filter(
                    width: size.width * 0.25,
                    height: size.height,
                    onSelected: (filter) {
                      switch (filter) {
                        case 'tutte':
                          setState(() {
                            imagePaths =
                                backgroundPaths + landscapePaths + stickerPaths;
                          });
                          break;
                        case 'background':
                          setState(() {
                            imagePaths = backgroundPaths;
                          });
                          break;
                        case 'paesaggi':
                          setState(() {
                            imagePaths = landscapePaths;
                          });
                          break;
                        case 'sticker':
                          setState(() {
                            imagePaths = stickerPaths;
                          });
                          break;
                        default:
                          setState(() {
                            imagePaths =
                                backgroundPaths + landscapePaths + stickerPaths;
                          });
                          break;
                      }
                    },
                  ),
                ),
              Manager(
                width: size.width - (size.height * 0.07),
                height: size.height,
                images: images,
                platform: getPlatform(),
                onChange: (selection) {
                  setState(() {
                    mode = selection;
                  });
                },
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 5),
              //   child: Container(
              //     width: (size.width * 0.80) - 45,
              //     height: size.width * 0.03 + 20,
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     decoration: const BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(30)),
              //       gradient: LinearGradient(
              //           stops: [0, 1],
              //           begin: Alignment.topLeft,
              //           end: Alignment.bottomRight,
              //           colors: [kDarkGradient, kLightGradient]),
              //     ),
              //     child: ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: ImageCategory().list.length,
              //       padding: EdgeInsets.symmetric(vertical: 5),
              //       itemBuilder: (BuildContext context, int index) {
              //         return Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 5),
              //           child: InkWell(
              //             onTap: () {
              //               if (ImageCategory().list[index] == 'tutte') {
              //                 setState(() {
              //                   imagePaths = backgroundPaths +
              //                       landscapePaths +
              //                       stickerPaths;
              //                   selectedCategory =
              //                       ImageCategory().list[index];
              //                 });
              //               } else if (ImageCategory().list[index] ==
              //                   'background') {
              //                 setState(() {
              //                   imagePaths = backgroundPaths;
              //                   selectedCategory =
              //                       ImageCategory().list[index];
              //                 });
              //               } else if (ImageCategory().list[index] ==
              //                   'paesaggi') {
              //                 setState(() {
              //                   imagePaths = landscapePaths;
              //                   selectedCategory =
              //                       ImageCategory().list[index];
              //                 });
              //               } else if (ImageCategory().list[index] ==
              //                   'sticker') {
              //                 setState(() {
              //                   imagePaths = stickerPaths;
              //                   selectedCategory =
              //                       ImageCategory().list[index];
              //                 });
              //               }
              //             },
              //             child: Chip(
              //               backgroundColor: selectedCategory ==
              //                       ImageCategory().list[index]
              //                   ? kTertiaryColor
              //                   : kSecondaryColor,
              //               label: Text(
              //                 ImageCategory().list[index],
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                   color: selectedCategory ==
              //                           ImageCategory().list[index]
              //                       ? kSecondaryColor
              //                       : kTertiaryColor,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              if (mode != Mode.none)
                Positioned(
                  right: 0,
                  child: mode == Mode.edit
                      ? Layers(
                          width: size.width * 0.25,
                          height: size.height,
                          images: images,
                          onReorder: (list) {
                            setState(() {
                              images = list;
                            });
                          },
                          onTap: (img) {
                            setState(() {
                              selected = img;
                            });
                          },
                        )
                      : component.Drawer(
                          width: size.width * 0.25,
                          height: size.height,
                          pathList: imagePaths,
                          selectedPaths: List.generate(
                              images.length, (index) => images[index].path),
                          onTap: (path) {
                            setState(() {
                              images.any((element) => element.path == path)
                                  ? images.removeWhere(
                                      (element) => element.path == path)
                                  : images.add(ImageSetting(
                                      path: path,
                                      x: 0,
                                      y: 0,
                                      width: 1000,
                                      height: 1000,
                                      opacity: 100,
                                      rotation: 0,
                                    ));
                            });
                          },
                        ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
