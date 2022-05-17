import 'package:flutter/material.dart';
import 'package:personal_website/models/widget_furniture.dart';

import '../../../utils/constant.dart';

class RenderWidget extends StatefulWidget {
  RenderWidget(
      {Key? key,
      required this.furniture,
      this.maxWidth,
      required this.selected,
      required this.onTap,
      this.onAccept})
      : super(key: key);

  Widget furniture;
  final double? maxWidth;
  final Widget? selected;
  Function(Widget) onTap;
  Function(WidgetFurniture)? onAccept;

  @override
  State<RenderWidget> createState() => _RenderWidgetState();
}

class _RenderWidgetState extends State<RenderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (widget.furniture.runtimeType == Flexible) {
      Container container = (widget.furniture as Flexible).child as Container;
      return Flexible(
        fit: FlexFit.loose,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: container.color,
              border: Border.all(
                color: widget.selected == widget.furniture
                    ? kPrimaryColor
                    : kDisabledColor,
                width: 3,
              ),
            ),
            child: container.child,
          ),
          onTap: () => widget.onTap(widget.furniture),
        ),
      );
    // }else if (widget.furniture.runtimeType == Container) {
    //     Container container = widget.furniture as Container;
    //     return Flexible(
    //       fit: FlexFit.loose,
    //       child: InkWell(
    //         child: Container(
    //           padding: EdgeInsets.all(5),
    //           decoration: BoxDecoration(
    //             color: container.color,
    //             border: Border.all(
    //               color: widget.selected == widget.furniture
    //                   ? kPrimaryColor
    //                   : kDisabledColor,
    //               width: 3,
    //             ),
    //           ),
    //           child: container.child,
    //         ),
    //         onTap: () => widget.onTap(widget.furniture),
    //       ),
    //     );
    } else if (widget.furniture.runtimeType == Row) {
      Row row = widget.furniture as Row;
      return DragTarget<WidgetFurniture>(
        builder: (context, candidateData, rejectedData) {
          return InkWell(
            child: Container(
              constraints: BoxConstraints(
                minHeight: size.height * 0.20,
                maxHeight: size.height,
              ),
              width: widget.maxWidth,
              //height: size.height * 0.20,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.selected == widget.furniture
                      ? kPrimaryColor
                      : kDisabledColor,
                  width: 3,
                ),
              ),
              child: Row(
                crossAxisAlignment: row.crossAxisAlignment,
                mainAxisAlignment: row.mainAxisAlignment,
                mainAxisSize: row.mainAxisSize,
                children: [
                  for (Widget child in row.children)
                    getRenderChild(child, row.children.length)!,
                ],
                //children: row.children,
              ),
            ),
            onTap: () => widget.onTap(widget.furniture),
          );
        },
        onWillAccept: (data) {
          if (data?.type == WidgetType.row || data.runtimeType != WidgetFurniture) {
            return false;
          } else {
            return true;
          }
        },
        onAccept: (data) => widget.onAccept!(data),
      );
    } else {
      return Container();
    }
  }

  Widget? getRenderChild(Widget? child, int childrenLenght) {
    if (child.runtimeType == Flexible) {
      return RenderWidget(
        furniture: child as Flexible,
        selected: widget.selected,
        onTap: (data) => widget.onTap(data),
      );
    } else if (child.runtimeType == Container) {
      return RenderWidget(
        furniture: child as Container,
        selected: widget.selected,
        onTap: (data) => widget.onTap(data),
      );
    }else if (child.runtimeType == Row) {
      return RenderWidget(
        maxWidth: (widget.maxWidth! - 16) / childrenLenght,
        furniture: child as Row,
        selected: widget.selected,
        onTap: (data) => widget.onTap(data),
        onAccept: (data) => widget.onAccept!(data),
      );
    } else {
      return null;
    }
  }
}
