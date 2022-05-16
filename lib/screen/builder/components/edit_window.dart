import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_website/screen/builder/components/text_editor_widget.dart';
import 'package:text_style_editor/text_style_editor.dart';

import '../../../utils/constant.dart';

class EditWindow extends StatefulWidget {
  EditWindow({
    Key? key,
    required this.onDragEnd,
    required this.widget,
    required this.onChanged,
    required this.onClose,
  }) : super(key: key);

  Widget widget;
  final Function(DraggableDetails) onDragEnd;
  final Function(Widget) onChanged;
  final Function() onClose;
  @override
  State<EditWindow> createState() => _EditWindowState();
}

class _EditWindowState extends State<EditWindow> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Draggable(
      feedback: Container(
        // width: size.width * 0.25,
        // height: size.height * 0.35,
        width: size.width * 0.5,
        height: size.height * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: kDisabledColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(widget.widget.runtimeType.toString()),
              actions: [
                IconButton(
                  onPressed: () => widget.onClose(),
                  icon: const Icon(Icons.close),
                ),
              ],
              backgroundColor: kPrimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: getWidgetInfo(size),
              ),
            ),
          ),
        ),
      ),
      childWhenDragging: Container(),
      child: Container(
        // width: size.width * 0.25,
        // height: size.height * 0.35,
        width: size.width * 0.5,
        height: size.height * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            color: kDisabledColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(widget.widget.runtimeType.toString()),
              actions: [
                IconButton(
                  onPressed: () => widget.onClose(),
                  icon: const Icon(Icons.close),
                ),
              ],
              backgroundColor: kPrimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: getWidgetInfo(size),
              ),
            ),
          ),
        ),
      ),
      onDragEnd: (drag) {
        widget.onDragEnd(drag);
      },
    );
  }

  List<Widget> getWidgetInfo(Size size) {
    if (widget.widget.runtimeType == Row) {
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('crossAxisAlignment: '),
            ),
            SizedBox(
              width: size.width * 0.05,
              child: DropdownButtonFormField<CrossAxisAlignment>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 1.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                value: (widget.widget as Row).crossAxisAlignment,
                items: <CrossAxisAlignment>[
                  CrossAxisAlignment.start,
                  CrossAxisAlignment.center,
                  CrossAxisAlignment.stretch,
                  CrossAxisAlignment.end,
                ].map<DropdownMenuItem<CrossAxisAlignment>>(
                    (CrossAxisAlignment value) {
                  return DropdownMenuItem<CrossAxisAlignment>(
                    value: value,
                    child: SizedBox(
                      width: size.width * 0.03,
                      child: Text(value.name),
                    ),
                  );
                }).toList(),
                onChanged: (CrossAxisAlignment? crossAxisAlignment) {
                  widget.onChanged(
                    Row(
                      crossAxisAlignment: crossAxisAlignment!,
                      mainAxisAlignment:
                          (widget.widget as Row).mainAxisAlignment,
                      mainAxisSize: (widget.widget as Row).mainAxisSize,
                      children: (widget.widget as Row).children,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('mainAxisAlignment: '),
            ),
            SizedBox(
              width: size.width * 0.09,
              child: DropdownButtonFormField<MainAxisAlignment>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 1.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                value: (widget.widget as Row).mainAxisAlignment,
                items: <MainAxisAlignment>[
                  MainAxisAlignment.end,
                  MainAxisAlignment.center,
                  MainAxisAlignment.start,
                  MainAxisAlignment.spaceBetween,
                  MainAxisAlignment.spaceEvenly,
                  MainAxisAlignment.spaceAround,
                ].map<DropdownMenuItem<MainAxisAlignment>>(
                    (MainAxisAlignment value) {
                  return DropdownMenuItem<MainAxisAlignment>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
                onChanged: (MainAxisAlignment? mainAxisAlignment) {
                  widget.onChanged(
                    Row(
                      crossAxisAlignment:
                          (widget.widget as Row).crossAxisAlignment,
                      mainAxisAlignment: mainAxisAlignment!,
                      mainAxisSize: (widget.widget as Row).mainAxisSize,
                      children: (widget.widget as Row).children,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('mainAxisSize: '),
            ),
            SizedBox(
              width: size.width * 0.04,
              child: DropdownButtonFormField<MainAxisSize>(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 1.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                value: (widget.widget as Row).mainAxisSize,
                items: <MainAxisSize>[
                  MainAxisSize.max,
                  MainAxisSize.min,
                ].map<DropdownMenuItem<MainAxisSize>>((MainAxisSize value) {
                  return DropdownMenuItem<MainAxisSize>(
                    value: value,
                    child: Text(
                      value.name,
                    ),
                  );
                }).toList(),
                onChanged: (MainAxisSize? mainAxisSize) {
                  widget.onChanged(
                    Row(
                      crossAxisAlignment:
                          (widget.widget as Row).crossAxisAlignment,
                      mainAxisAlignment:
                          (widget.widget as Row).mainAxisAlignment,
                      mainAxisSize: mainAxisSize!,
                      children: (widget.widget as Row).children,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ];
    } else if (widget.widget.runtimeType == Flexible) {
      List<String> fonts = [
        'Billabong',
        'AlexBrush',
        'Allura',
        'Arizonia',
        'ChunkFive',
        'GrandHotel',
        'GreatVibes',
        'Lobster',
        'OpenSans',
        'OstrichSans',
        'Oswald',
        'Pacifico',
        'Quicksand',
        'Roboto',
        'SEASRN',
        'Windsong',
      ];
      List<Color> paletteColors = [
        Colors.black,
        Colors.white,
        Color(int.parse('0xffEA2027')),
        Color(int.parse('0xff006266')),
        Color(int.parse('0xff1B1464')),
        Color(int.parse('0xff5758BB')),
        Color(int.parse('0xff6F1E51')),
        Color(int.parse('0xffB53471')),
        Color(int.parse('0xffEE5A24')),
        Color(int.parse('0xff009432')),
        Color(int.parse('0xff0652DD')),
        Color(int.parse('0xff9980FA')),
        Color(int.parse('0xff833471')),
        Color(int.parse('0xff112CBC4')),
        Color(int.parse('0xffFDA7DF')),
        Color(int.parse('0xffED4C67')),
        Color(int.parse('0xffF79F1F')),
        Color(int.parse('0xffA3CB38')),
        Color(int.parse('0xff1289A7')),
        Color(int.parse('0xffD980FA'))
      ];
      TextStyle textStyle = TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontFamily: 'OpenSans',
      );
      TextAlign textAlign = TextAlign.start;
      return [
        // Row(
        //   children: [
        //     const Align(
        //       alignment: Alignment.centerLeft,
        //       child: Text('fit: '),
        //     ),
        //     SizedBox(
        //       width: size.width * 0.05,
        //       child: DropdownButtonFormField<FlexFit>(
        //         decoration: InputDecoration(
        //           contentPadding: EdgeInsets.zero,
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           enabledBorder: OutlineInputBorder(
        //             borderSide:
        //                 const BorderSide(color: kPrimaryColor, width: 1.0),
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //           focusedBorder: OutlineInputBorder(
        //             borderSide:
        //                 const BorderSide(color: kPrimaryColor, width: 2.0),
        //             borderRadius: BorderRadius.circular(15),
        //           ),
        //         ),
        //         value: (widget.widget as Flexible).fit,
        //         items: <FlexFit>[
        //           FlexFit.loose,
        //           FlexFit.tight,
        //         ].map<DropdownMenuItem<FlexFit>>((FlexFit value) {
        //           return DropdownMenuItem<FlexFit>(
        //             value: value,
        //             child: Text(
        //               value.name,
        //             ),
        //           );
        //         }).toList(),
        //         onChanged: (FlexFit? mainAxisSize) {
        //           widget.onChanged(widget.widget);
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        // Text(
        //   (((widget.widget as Flexible).child as Container).child as Text)
        //       .data!,
        //   textAlign: textAlign,
        //   style: textStyle,
        // ),
        //TextEditorWidget(text: ((widget.widget as Flexible).child as Container).child as Text,),
      ];
    } else {
      return [];
    }
  }
}
