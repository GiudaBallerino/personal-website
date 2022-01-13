import 'package:flutter/material.dart';
import '../constant.dart';


class SyContainer extends StatelessWidget {
  EdgeInsets? margin;
  double height;
  double width;
  Color? color;
  Widget child;
  BorderRadiusGeometry borderRadius;
  bool emboss;

  SyContainer({Key? key,
    this.margin,
    required this.child,
    required this.height,
    required this.width,
    this.color,
    required this.borderRadius,
    required this.emboss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: emboss ? kDarkShadow:kLightShadow,
        borderRadius: borderRadius,
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
