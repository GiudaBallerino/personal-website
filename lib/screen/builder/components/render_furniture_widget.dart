import 'package:flutter/material.dart';
import 'package:personal_website/models/widget_furniture.dart';

import '../../../utils/constant.dart';

class RenderWidget extends StatefulWidget {
  RenderWidget(
      {Key? key,
      required this.furniture,
      required this.selected,
      required this.onTap,
      required this.onAccept})
      : super(key: key);

  Widget furniture;
  final Widget? selected;
  Function() onTap;
  Function(WidgetFurniture) onAccept;

  @override
  State<RenderWidget> createState() => _RenderWidgetState();
}

class _RenderWidgetState extends State<RenderWidget> {

  @override
  Widget build(BuildContext context) {
    if (widget.furniture.runtimeType == Container){
      Container container=widget.furniture as Container;
      return DragTarget<WidgetFurniture>(
        builder: (context, candidateData, rejectedData) {
          return InkWell(
            child: Container(
              width: container.constraints?.maxWidth ?? 100,
              height: container.constraints?.maxHeight ?? 100,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: container.color,
                border: Border.all(
                  color: widget.selected==widget.furniture ? kPrimaryColor : kDisabledColor,
                  width: 3,
                ),
              ),
              child: getRenderChild(container.child),
            ),
            onTap: () =>widget.onTap(),
          );
        },
        onWillAccept: (data) {
          if (container.child == null) {
            return true;
          } else {
            return false;
          }
        },
        onAccept: (data) =>widget.onAccept(data),
      );
    }
    else if(widget.furniture.runtimeType == Row){
      Row row=widget.furniture as Row;
      return DragTarget<WidgetFurniture>(
        builder: (context, candidateData, rejectedData) {
          return InkWell(
            child: Container(
              constraints: BoxConstraints(
                minHeight: 100,
                minWidth: 700,
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.selected==widget.furniture
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
                  for(Widget child in row.children)
                    getRenderChild(child)!,
                ],
              ),
            ),
            onTap: () =>widget.onTap(),
          );
        },
        onWillAccept: (data) =>true,
        onAccept: (data) =>widget.onAccept(data),
      );
    }
    else{
      return Container();
    }
  }

  Widget? getRenderChild(Widget? child){
    if (child.runtimeType == Container)
      return RenderWidget(
        furniture: child as Container,
        selected: widget.selected,
        onTap: () =>widget.onTap(),
        onAccept: (data) {},
      );
    else if (child.runtimeType == Row)
      return RenderWidget(
        furniture: child as Row,
        selected: widget.selected,
        onTap: () =>widget.onTap(),
        onAccept: (data) {},
      );
    else if(child==null){
      return null;
    }
    else{
      return Container();
    }
  }
}
