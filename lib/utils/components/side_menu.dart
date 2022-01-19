import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:personal_website/utils/components/side_menu_controller.dart';

class SideMenu extends StatefulWidget {
  SideMenu({
    Key? key,
    required this.controller,
    required this.initWidth,
    required this.initHeight,
    required this.initColor,
    required this.initBorderRadius,
    this.initListBoxShadow,
    this.initGradient,
    this.initChild,
    required this.finalWidth,
    required this.finalHeight,
    required this.finalColor,
    required this.finalBorderRadius,
    //this.finalListBoxShadow, //todo non utilizzati
    //this.finalGradient //
    this.finalChild,
    required this.duration,
    this.childDuration,
    this.childReverseDuration,
  }) : super(key: key);

  final SideMenuController controller;
  final double initWidth;
  final double initHeight;
  final Color initColor;
  final BorderRadiusGeometry initBorderRadius;
  final List<BoxShadow>? initListBoxShadow;
  final LinearGradient? initGradient;
  Widget? initChild;

  final double finalWidth;
  final double finalHeight;
  final Color finalColor;
  final BorderRadiusGeometry finalBorderRadius;
  //final List<BoxShadow>? finalListBoxShadow; todo non utilizzati
  //final LinearGradient? finalGradient;
  Widget? finalChild;

  final Duration duration;
  Duration? childDuration;
  Duration? childReverseDuration;

  close() => createState().close();
  open()=> createState().open();

  @override
  _SideMenuState createState() => _SideMenuState(controller);
}

class _SideMenuState extends State<SideMenu> with TickerProviderStateMixin {
  _SideMenuState(SideMenuController _controller) {
    _controller.close = close;
    _controller.open=open;
  }

  late AnimationController controller;

  late Animation<double> heightAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<BorderRadiusGeometry> radiusAnimation;

  late Widget? _nowChild;
  late bool isOpen;

  @override
  void initState() {
    super.initState();
    isOpen=false;
    controller = AnimationController(duration: widget.duration, vsync: this);

    heightAnimation =
        Tween<double>(begin: widget.initHeight, end: widget.finalHeight)
            .animate(controller)
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              setState(() => _nowChild = widget.finalChild);
            } else if (status == AnimationStatus.reverse) {
              setState(() => _nowChild = widget.initChild);
            }
          });
    colorAnimation = ColorTween(begin: widget.initColor, end: widget.finalColor)
        .animate(controller);
    radiusAnimation = Tween<BorderRadiusGeometry>(
            begin: widget.initBorderRadius, end: widget.finalBorderRadius)
        .animate(controller);

    heightAnimation.addListener(() {
      setState(() {});
    });
    colorAnimation.addListener(() {
      setState(() {});
    });

    _nowChild = widget.initChild;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if ((defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android)){
      return GestureDetector(
        onTap: (){
          open();
        },
        child: Container(
          width: widget.initWidth,
          height: heightAnimation.value,
          decoration: BoxDecoration(
            color: colorAnimation.value,
            borderRadius: radiusAnimation.value,
            boxShadow: widget.initListBoxShadow,
            gradient: widget.initGradient,
          ),
          child: _nowChild != null
              ? AnimatedSwitcher(
            duration: widget.childDuration ?? const Duration(seconds: 0),
            reverseDuration:
            widget.childReverseDuration ?? const Duration(seconds: 0),
            child: _nowChild,
          )
              : null,
        ),
      );
    }
    else{
    return MouseRegion(
      onEnter: (e) => open(),
      onExit: (e) => close(),
      child: Container(
        width: widget.initWidth,
        height: heightAnimation.value,
        decoration: BoxDecoration(
          color: colorAnimation.value,
          borderRadius: radiusAnimation.value,
          boxShadow: widget.initListBoxShadow,
          gradient: widget.initGradient,
        ),
        child: _nowChild != null
            ? AnimatedSwitcher(
                duration: widget.childDuration ?? const Duration(seconds: 0),
                reverseDuration:
                    widget.childReverseDuration ?? const Duration(seconds: 0),
                child: _nowChild,
              )
            : null,
      ),
    );}
  }
  void close(){
    if(isOpen) controller.reverse().orCancel;
    setState(() {
      isOpen=false;
    });
  }
  void open(){
    if(!isOpen) controller.forward().orCancel;
    setState(() {
      isOpen=true;
    });
  }
  // void _mouseEnter(bool hover) {
  //   if (hover)
  //     controller.forward().orCancel;
  //   else
  //     controller.reverse().orCancel;
  // }
}
