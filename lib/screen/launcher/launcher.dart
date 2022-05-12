import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personal_website/screen/launcher/components/editor.dart';
import 'package:personal_website/screen/launcher/components/filter.dart';
import 'package:personal_website/screen/launcher/components/manager.dart';
import 'package:personal_website/screen/launcher/components/layers.dart';
import 'package:personal_website/utils/components/page_selector.dart';
import 'package:personal_website/utils/components/side_menu.dart';
import 'package:personal_website/utils/components/side_menu_controller.dart';

import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/screen/launcher/components/drawer.dart'
    as component;

import '../../helper/data.dart';
import '../../models/image_setting.dart';

enum Mode { add, edit, none }

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

    if ((defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android)) {
      return GestureDetector(
        onTap: () {
          sideController.close();
        },
        child: Stack(
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
            Positioned(
              right: 0,
              top: 0,
              child: Manager(
                width: size.width - (size.height * 0.08),
                height: size.height,
                color: kAltBackgroundColor,
                images: images,
                onChange: (selection) {
                  setState(() {
                    mode = selection;
                  });
                },
              ),
            ),
            if (mode == Mode.edit) ...[
              Positioned(
                bottom: 0,
                child: Layers(
                  width: size.width,
                  height: size.height - (size.width*1.05),
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
                ),
              ),
              // if (selected != null) todo sistemare modifica
              //   Positioned(
              //     left: 0,
              //     child: Editor(
              //       width: size.width * 0.25,
              //       height: size.height,
              //       widthController:
              //           TextEditingController(text: selected!.width.toString()),
              //       heightController: TextEditingController(
              //           text: selected!.height.toString()),
              //       opacityController: TextEditingController(
              //           text: selected!.opacity.toString()),
              //       rotationController: TextEditingController(
              //           text: selected!.rotation.toString()),
              //       onWidthChange: (width) {
              //         setState(() {
              //           images[images.indexOf(selected!)].width = width;
              //         });
              //       },
              //       onHeightChange: (height) {
              //         setState(() {
              //           images[images.indexOf(selected!)].height = height;
              //         });
              //       },
              //       onOpacityChange: (opacity) {
              //         setState(() {
              //           images[images.indexOf(selected!)].opacity = opacity;
              //         });
              //       },
              //       onRotationChange: (rotation) {
              //         setState(() {
              //           images[images.indexOf(selected!)].rotation = rotation;
              //         });
              //       },
              //     ),
              //   ),
            ],
            if (mode == Mode.add) ...[
              Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    Filter(
                      width: size.width,
                      height: size.height *0.06,
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
                    component.Drawer(
                      width: size.width,
                      height: size.height - (size.width*1.1),
                      pathList: imagePaths,
                      selectedPaths: List.generate(
                          images.length, (index) => images[index].path),
                      onTap: (path) {
                        setState(() {
                          images.any((element) => element.path == path)
                              ? images
                              .removeWhere((element) => element.path == path)
                              : images.add(
                            ImageSetting(
                              path: path,
                              x: 0,
                              y: 0,
                              width: 1000,
                              height: 1000,
                              opacity: 100,
                              rotation: 0,
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),
      );
    } else {
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
                Manager(
                  width: size.width - (size.height * 0.07),
                  height: size.height,
                  images: images,
                  color: kAltBackgroundColor,
                  onChange: (selection) {
                    setState(() {
                      mode = selection;
                    });
                  },
                ),
                if (mode == Mode.edit) ...[
                  Positioned(
                    right: 0,
                    child: Layers(
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
                    ),
                  ),
                  if (selected != null)
                    Positioned(
                      left: 0,
                      child: Editor(
                        width: size.width * 0.25,
                        height: size.height,
                        widthController: TextEditingController(
                            text: selected!.width.toString()),
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
                            images[images.indexOf(selected!)].rotation =
                                rotation;
                          });
                        },
                      ),
                    ),
                ],
                if (mode == Mode.add) ...[
                  Positioned(
                    right: 0,
                    child: component.Drawer(
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
                              : images.add(
                                  ImageSetting(
                                    path: path,
                                    x: 0,
                                    y: 0,
                                    width: 1000,
                                    height: 1000,
                                    opacity: 100,
                                    rotation: 0,
                                  ),
                                );
                        });
                      },
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Filter(
                      width: size.width * 0.25,
                      height: size.height,
                      onSelected: (filter) {
                        switch (filter) {
                          case 'tutte':
                            setState(() {
                              imagePaths = backgroundPaths +
                                  landscapePaths +
                                  stickerPaths;
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
                              imagePaths = backgroundPaths +
                                  landscapePaths +
                                  stickerPaths;
                            });
                            break;
                        }
                      },
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      );
    }
  }
}
