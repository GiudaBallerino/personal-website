import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_website/utils/components/editable_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant.dart';
import '../../../utils/models/image_setting.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;

import '../launcher.dart';

typedef void SelectionCallback(Mode mode);

class Manager extends StatefulWidget {
  Manager({
    Key? key,
    required this.width,
    required this.height,
    required this.images,
    required this.platform,
    required this.onChange,
  }) : super(key: key);
  final double width;
  final double height;
  List<ImageSetting> images;
  String platform;
  SelectionCallback onChange;
  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  bool isLoading = false;
  Mode mode = Mode.none;
  final GlobalKey _globalKey = GlobalKey();
  ImageSetting? selected;

  Future _captureBase64() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();
    return base64Encode(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Spacer(),
          Row(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: InkWell(
                  onTap: () {
                    if (mode == Mode.edit) {
                      setState(() {
                        mode = Mode.none;
                      });
                    } else {
                      mode = Mode.edit;
                    }
                    widget.onChange(mode);
                  },
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      border: mode == Mode.edit
                          ? Border.all(color: kPrimaryColor, width: 5)
                          : null,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.settings,
                      color: mode == Mode.edit ? kPrimaryColor : kDisabledColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: InkWell(
                  onTap: () {
                    if (mode == Mode.add) {
                      setState(() {
                        mode = Mode.none;
                      });
                    } else {
                      mode = Mode.add;
                    }
                    widget.onChange(mode);
                  },
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      border: mode == Mode.add
                          ? Border.all(color: kPrimaryColor, width: 5)
                          : null,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.add,
                      color: mode == Mode.add ? kPrimaryColor : kDisabledColor,
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          Container(
            width: widget.width * 0.4,
            height: widget.width * 0.4,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: widget.images.isEmpty
                ? Center(
                    child: Text('Seleziona un immagine'),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: RepaintBoundary(
                      key: _globalKey,
                      child: Stack(
                        children: [
                          for (ImageSetting image in widget.images)
                            // Positioned(
                            //   left: image.x,
                            //   top: image.y,
                            //   child: Draggable(
                            //     feedback: Transform.rotate(
                            //       angle: image.rotation * (pi / 180),
                            //       child: Opacity(
                            //         opacity: image.opacity / 100,
                            //         child: Image.asset(
                            //           image.path,
                            //           fit: BoxFit.cover,
                            //           width: min(
                            //               image.width,
                            //               image.width /
                            //                   (image.width /
                            //                       (widget.width * 0.4))),
                            //           height: min(
                            //               image.height,
                            //               image.height /
                            //                   (image.height /
                            //                       (widget.width * 0.4))),
                            //         ),
                            //       ),
                            //     ),
                            //     childWhenDragging: Container(),
                            //     child: Transform.rotate(
                            //       angle: image.rotation * (pi / 180),
                            //       child: Opacity(
                            //         opacity: image.opacity / 100,
                            //         child: Image.asset(
                            //           image.path,
                            //           fit: BoxFit.cover,
                            //           width: min(
                            //               image.width,
                            //               image.width /
                            //                   (image.width /
                            //                       (widget.width * 0.4))),
                            //           height: min(
                            //               image.height,
                            //               image.height /
                            //                   (image.height /
                            //                       (widget.width * 0.4))),
                            //         ),
                            //       ),
                            //     ),
                            //     onDragEnd: (dragDatails) {
                            //       RenderBox renderBox = context.findRenderObject() as RenderBox;
                            //       Offset offset=renderBox.globalToLocal(dragDatails.offset);
                            //       print(dragDatails.offset);
                            //       print(offset);
                            //       setState(() {
                            //         image.x=offset.dx;
                            //         image.y=offset.dy;
                            //         // image.x = dragDatails.offset.dx -
                            //         //     (widget.width * 0.3357);
                            //         // image.y = dragDatails.offset.dy -
                            //         //     (widget.height * 0.076);
                            //       });
                            //     },
                            //   ),
                            // ),
                            Positioned(
                              left: image.x,
                              top: image.y,
                              child: EditableImage(
                                image: image,
                                size: Size(
                                    min(
                                        image.width,
                                        image.width /
                                            (image.width /
                                                (widget.width * 0.4))),
                                    min(
                                        image.height,
                                        image.height /
                                            (image.height /
                                                (widget.width * 0.4)))),
                                onDragEnd: (offset) {
                                  setState(() {
                                    image.x+=offset.dx;
                                    image.y+=offset.dy;
                                  });
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                        _captureBase64().then((value) {
                          SharedPreferences.getInstance().then((prefs) {
                            prefs.setString('genImg', value).then((f) {
                              html.window.open('/art', '_blank');
                              setState(() {
                                isLoading = false;
                              });
                            });
                          });
                        });
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: kPrimaryColor,
              ),
              child: Text(
                "Procedi",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
