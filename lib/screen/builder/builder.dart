import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:personal_website/models/widget_furniture.dart';
import 'package:personal_website/screen/builder/components/element_sectrion.dart';
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

  List<WidgetFurniture> widgetList = [];

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
              List<Map<String, dynamic>> mainTree=BuilderService().getWidgetMainTree(widgetJson);
              if (mainTree.isEmpty) {
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
                      for (Map<String, dynamic> widget in mainTree)
                        if (widget["type"] == "container")
                          InkWell(
                            child: Container(
                              width: size.width * ((widgetList.singleWhere((element) => element.id==widget["id"]) as ContainerFurniture).width / 100),
                              height: size.height * ((widgetList.singleWhere((element) => element.id==widget["id"]) as ContainerFurniture).height / 100),
                              decoration: BoxDecoration(
                                color: (widgetList.singleWhere((element) => element.id==widget["id"]) as ContainerFurniture).color,
                                border: Border.all(
                                  color: widgetList.singleWhere((element) => element.id==widget["id"]).selected
                                      ? kPrimaryColor
                                      : kDisabledColor,
                                  width: 3,
                                ),
                              ),
                            ),
                            onTap: () {
                              //print(widgetJson);
                              //print(widget["id"]);
                              setState(() {
                                if (widgetList.singleWhere((element) => element.id==widget["id"]).selected) {
                                  widgetList[widgetList.indexOf(widgetList.singleWhere((element) => element.id==widget["id"]))]
                                      .selected = false;
                                } else {
                                  widgetList.forEach((element) {
                                    if (element.selected) {
                                      widgetList[widgetList.indexOf(element)]
                                          .selected = false;
                                    }
                                  });
                                  widgetList[widgetList.indexOf(widgetList.singleWhere((element) => element.id==widget["id"]))]
                                      .selected = true;
                                }
                              });
                            },
                          )
                        else if (widget["type"] == "row")
                          DragTarget<WidgetFurniture>(
                            builder: (context, candidateData, rejectedData) {
                              return InkWell(
                                child: Row(
                                  crossAxisAlignment: (widgetList.singleWhere((element) => element.id==widget["id"]) as RowFurniture).crossAxisAlignment,
                                  mainAxisAlignment:(widgetList.singleWhere((element) => element.id==widget["id"]) as RowFurniture).mainAxisAlignment,
                                  mainAxisSize:(widgetList.singleWhere((element) => element.id==widget["id"]) as RowFurniture).mainAxisSize,
                                  children: [
                                    Container(
                                      width: size.width * 0.5,
                                      height: size.height * 0.2,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: widgetList.singleWhere((element) => element.id==widget["id"]).selected
                                              ? kPrimaryColor
                                              : kDisabledColor,
                                          width: 3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  //print(widgetJson);
                                  //print(widget.id);
                                  print(BuilderService().getWidgetTreeFromId(widgetJson,widget["id"]));
                                  setState(() {
                                    if (widgetList.singleWhere((element) => element.id==widget["id"]).selected) {
                                      widgetList[widgetList.indexOf(widgetList.singleWhere((element) => element.id==widget["id"]))]
                                          .selected = false;
                                    } else {
                                      widgetList.forEach((element) {
                                        if (element.selected) {
                                          widgetList[widgetList.indexOf(element)]
                                              .selected = false;
                                        }
                                      });
                                      widgetList[widgetList.indexOf(widgetList.singleWhere((element) => element.id==widget["id"]))]
                                          .selected = true;
                                    }
                                  });
                                },
                              );
                            },
                            onWillAccept: (data) => true,
                            onAccept: (data) {
                              setState(() {
                                widgetJson=BuilderService().addToRowFromId(widget["id"], id, widgetJson, data);
                                widgetList.add(data);
                                id++;
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
                widgetJson=BuilderService().addToMainColumn(id, widgetJson, data);
                widgetList.add(data);
                id++;
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
