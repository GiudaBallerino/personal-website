import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:personal_website/models/widget_furniture.dart';
import 'package:personal_website/screen/builder/components/element_sectrion.dart';
import 'package:personal_website/screen/builder/components/render_furniture_widget.dart';
import 'package:personal_website/utils/services/builder_service.dart';
import '../../utils/constant.dart';

enum Menu {
  widget,
  setting,
}

class Builder extends StatefulWidget {
  const Builder({Key? key}) : super(key: key);

  @override
  State<Builder> createState() => _BuilderState();
}

class _BuilderState extends State<Builder> with TickerProviderStateMixin {
  int id = 0;
  late TabController _tabController;
  Menu menu = Menu.widget;
  Widget? selected = null;
  List<Widget> widgetList = [];

  //List<WidgetFurniture> widgetList = [];

  Map<String, dynamic> widgetJson = {
    "type": "single_child_scroll_view",
    "child": {
      "type": "column",
      "children": [],
    }
  };

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //print(wid.)
    return Row(
      children: [
        Container(
          width: size.width * 0.5,
          height: size.height,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
          ),
          child: DragTarget<WidgetFurniture>(
            builder: (context, candidateData, rejectedData) {
              //List<Map<String, dynamic>> mainTree=BuilderService().getWidgetMainTree(widgetJson);
              if (widgetList.isEmpty) {
                return const Center(
                  child: Text(
                    'Drag and Drop',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      for (Widget widget in widgetList)
                        if (widget.runtimeType == Container)
                          RenderWidget(
                            furniture: widget as Container,
                            selected: selected,
                            onTap: () {
                              if (selected == widget) {
                                setState(() {
                                  selected = null;
                                });
                              } else {
                                setState(() {
                                  selected = widget;
                                });
                              }
                            },
                            onAccept: (data) {
                              Widget child;
                              switch (data.type) {
                                case WidgetType.container:
                                  child = Container(
                                    width: (data as ContainerFurniture)
                                        .widget
                                        .constraints
                                        ?.maxWidth,
                                    height:
                                        (data).widget.constraints?.maxHeight,
                                    color: Colors.red,
                                  );
                                  break;
                                case WidgetType.row:
                                  child = (data as RowFurniture).widget;
                                  break;
                                default:
                                  child = Container(
                                    width: (data as ContainerFurniture)
                                        .widget
                                        .constraints
                                        ?.maxWidth,
                                    height:
                                        (data).widget.constraints?.maxHeight,
                                    color: Colors.red,
                                  );
                                  break;
                              }

                              Container parent = Container(
                                width: (widgetList[widgetList.indexOf(widget)]
                                        as Container)
                                    .constraints
                                    ?.maxWidth,
                                height: (widgetList[widgetList.indexOf(widget)]
                                        as Container)
                                    .constraints
                                    ?.maxHeight,
                                child: child,
                              );

                              setState(() {
                                widgetList[widgetList.indexOf(widget)] = parent;
                              });
                            },
                          )
                        else if (widget.runtimeType == Row)
                          RenderWidget(
                            furniture: widget as Row,
                            selected: selected,
                            onTap: () {
                              print(widget);
                              if (selected == widget) {
                                setState(() {
                                  selected = null;
                                });
                              } else {
                                setState(() {
                                  selected = widget;
                                });
                              }
                            },
                            onAccept: (data) {
                              Widget child;
                              switch (data.type) {
                                case WidgetType.container:
                                  child = Container(
                                    width: (data as ContainerFurniture)
                                        .widget
                                        .constraints
                                        ?.maxWidth,
                                    height:
                                        (data).widget.constraints?.maxHeight,
                                    color: Colors.red,
                                  );
                                  break;
                                case WidgetType.row:
                                  child = (data as RowFurniture).widget;
                                  break;
                                default:
                                  child = Container(
                                    width: (data as ContainerFurniture)
                                        .widget
                                        .constraints
                                        ?.maxWidth,
                                    height:
                                        (data).widget.constraints?.maxHeight,
                                    color: Colors.red,
                                  );
                                  break;
                              }
                              Row parent =
                                  (widgetList[widgetList.indexOf(widget)]
                                      as Row);

                              parent.children.add(child);
                              setState(() {
                                widgetList[widgetList.indexOf(widget)] = parent;
                              });
                            },
                          ),
                    ],
                  ),
                );
              }
            },
            onWillAccept: (data) => true,
            onAccept: (data) {
              setState(() {
                if (data.runtimeType == ContainerFurniture) {
                  widgetList.add((data as ContainerFurniture).widget);
                } else if (data.runtimeType == RowFurniture) {
                  widgetList.add((data as RowFurniture).widget);
                }
              });
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  indicatorColor: kPrimaryColor,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.apps,
                        color: menu == Menu.widget
                            ? kPrimaryColor
                            : kDisabledColor,
                      ),
                    ),
                    Tab(
                        icon: Icon(
                      Icons.settings,
                      color:
                          menu == Menu.setting ? kPrimaryColor : kDisabledColor,
                    )),
                  ],
                  onTap: (int) {
                    if (int == 0) {
                      setState(() {
                        menu = Menu.widget;
                      });
                    } else {
                      setState(() {
                        menu = Menu.setting;
                      });
                    }
                  },
                ),
                if (menu == Menu.widget)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElementSection(),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
