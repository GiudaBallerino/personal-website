import 'dart:ui';

import 'package:personal_website/models/widget_furniture.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class BuilderService {

  // #################################
  //  GETTER METHODS
  // #################################

  // get default Image widget
  static Widget get defaultImage {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        child: Image.asset('assets/img/sticker/flower_0.webp',fit: BoxFit.none,),
      ),
    );
  }

  // get default Text widget
  static Widget get defaultText {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        child: Text(
          'Lorem ipsum',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  // get default Row widget
  static Widget get defaultRow {
    return Row(
      children: [],
    );
  }

  // get the Widget runtimeType
  static Type getWidgetType(Widget widget) {
    if (widget.runtimeType == Row || widget.runtimeType == Column) {
      return widget.runtimeType;
    } else {
      return ((widget as Flexible).child as Container).child.runtimeType;
    }
  }

  // get data from a Text widget
  static String? getTextData(Widget text) {
    return (((text as Flexible).child as Container).child as Text).data;
  }

  // return textAlign from a Text widget
  static TextAlign? getTextAlign(Widget text) {
    return (((text as Flexible).child as Container).child as Text).textAlign;
  }

  // return style from a Text widget
  static TextStyle? getTextStyle(Widget text) {
    return (((text as Flexible).child as Container).child as Text).style;
  }

  // #################################
  //  TEXT METHODS
  // #################################

  //  return a new TextWidget with the new TextStyle
  static Widget changeTextStyle(TextStyle style, Widget text) {
    return Flexible(
      fit: (text as Flexible).fit,
      child: Container(
        child: Text(
          getTextData(text)!,
          style: style,
          textAlign: getTextAlign(text),
        ),
      ),
    );
  }

  //  return a new TextWidget with the new TextAlign
  static Widget changeTextAlign(TextAlign align, Widget text) {
    return Flexible(
      fit: (text as Flexible).fit,
      child: Container(
        child: Text(
          getTextData(text)!,
          style: getTextStyle(text),
          textAlign: align,
        ),
      ),
    );
  }

  //  return a new TextWidget with new text data
  static Widget changeTextData(String data, Widget text) {
    return Flexible(
      fit: (text as Flexible).fit,
      child: Container(
        child: Text(
          data,
          style: getTextStyle(text),
          textAlign: getTextAlign(text),
        ),
      ),
    );
  }
}
