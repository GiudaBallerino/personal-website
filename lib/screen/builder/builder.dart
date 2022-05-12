import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:personal_website/models/widget_furniture.dart';
import 'package:personal_website/screen/builder/components/edit_window.dart';
import 'package:personal_website/screen/builder/components/element_sectrion.dart';
import 'package:personal_website/screen/builder/components/render_furniture_widget.dart';
import 'package:personal_website/screen/builder/components/row_editor_widget.dart';
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
  double editorX = 0;
  double editorY = 0;

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
    return Stack(
      children: [
        Row(
          children: [
            Container(
              width: size.width * 0.5,
              height: size.height,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(15)),
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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (Widget widget in widgetList)
                            if (widget.runtimeType == Flexible)
                              RenderWidget(
                                maxWidth: size.width * 0.5,
                                furniture: widget as Flexible,
                                selected: selected,
                                onTap: (data) {
                                  if (selected == data) {
                                    setState(() {
                                      selected = null;
                                    });
                                  } else {
                                    setState(() {
                                      selected = data;
                                    });
                                  }
                                },
                              )
                            else if (widget.runtimeType == Container)
                              RenderWidget(
                                maxWidth: size.width * 0.5,
                                furniture: widget as Container,
                                selected: selected,
                                onTap: (data) {
                                  if (selected == data) {
                                    setState(() {
                                      selected = null;
                                    });
                                  } else {
                                    setState(() {
                                      selected = data;
                                    });
                                  }
                                },
                              )
                            else if (widget.runtimeType == Row)
                              RenderWidget(
                                maxWidth: size.width * 0.5,
                                furniture: widget as Row,
                                selected: selected,
                                onTap: (data) {
                                  if (selected == data) {
                                    setState(() {
                                      selected = null;
                                    });
                                  } else {
                                    setState(() {
                                      selected = data;
                                    });
                                  }
                                },
                                onAccept: (data) {
                                  Widget child;

                                  switch (data.type) {
                                    case WidgetType.text:
                                      child = Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          child: Text(
                                            'Lorem ipsum',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      );
                                      break;
                                    case WidgetType.image:
                                      child = Container(
                                        child: Image.asset(
                                            'assets/img/sticker/flower_0.webp'),
                                      );
                                      break;
                                    case WidgetType.row:
                                      child = Row();
                                      break;
                                  }
                                  setState(() {
                                    (widgetList[widgetList.indexOf(widget)]
                                            as Row)
                                        .children
                                        .add(child);
                                  });
                                },
                              ),
                        ],
                      ),
                    );
                  }
                },
                onWillAccept: (data) => data.runtimeType == WidgetFurniture,
                onAccept: (data) {
                  Widget widget;
                  switch (data.type) {
                    case WidgetType.text:
                      widget = Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          child: Text(
                            'Lorem ipsum',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      );
                      break;
                    case WidgetType.image:
                      widget = Container(
                        child: Image.asset('assets/img/sticker/flower_0.webp'),
                      );
                      break;
                    case WidgetType.row:
                      widget = Row(
                        children: [],
                      );
                      break;
                  }
                  setState(() {
                    widgetList.add(widget);
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
                          color: menu == Menu.setting
                              ? kPrimaryColor
                              : kDisabledColor,
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ElementSection(),
                            InkWell(
                              child: Text('Anteprima'),
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/test', arguments: widgetList);
                              },
                            ),
                          ],
                        ),
                      )
                    else if(menu==Menu.setting)
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: getWidgetEditor(size),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget getWidgetEditor(Size size){
    switch (selected.runtimeType){
      case Row:
        return RowEditorWidget(
          width: size.width*0.09,
          height: size.height*0.4,
          row: selected as Row,
          onChanged: (widget) {
            setState(() {
              widgetList[widgetList.indexOf(selected!)] = widget;
              selected = widget;
            });
          },
        );
      case Flexible:
        return Container();
      case Container:
        return Container();
      default:
        return Container();
    }
  }
}
