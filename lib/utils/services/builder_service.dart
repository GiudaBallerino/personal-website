import 'package:personal_website/models/widget_furniture.dart';

class BuilderService {
  List<Map<String, dynamic>> getWidgetMainTree(Map<String, dynamic> widgetMap) {
    List<Map<String, dynamic>> tree = [];

    widgetMap["child"]["children"].forEach((element) {
      tree.add({"type": element["type"], "id": element["id"]});
    });

    return tree;
  }

  List<Map<String, dynamic>> getWidgetTreeFromId(Map<String, dynamic> widgetMap, int parentId) {
    List<Map<String, dynamic>> tree = [];

    widgetMap["child"]["children"].forEach((element) {
      if (element["id"] == parentId) {
        element["children"].forEach((child) {
          tree.add({"type": child["type"], "id": child["id"]});
        });
      }
    });

    return tree;
  }

  Map<String, dynamic> addToMainColumn(
      int currentID, Map<String, dynamic> widgetMap, WidgetFurniture widget) {
    Map<String, dynamic> result = widgetMap;
    widget.id = currentID;

    result["child"]["children"] = widgetMap["child"]["children"].toList()
      ..add(widget.toJson()).toString();

    return result;
  }

  Map<String, dynamic> addToRowFromId(int rowId, int currentID,
      Map<String, dynamic> widgetMap, WidgetFurniture widget) {
    Map<String, dynamic> result = widgetMap;
    widget.id = currentID;

    widgetMap["child"]["children"].forEach((element) {
      if (element["id"] == rowId) {
        result["child"]["children"]
                [result["child"]["children"].indexOf(element)]["children"] =
            element["children"].toList()..add(widget.toJson()).toString();
      }
    });

    return result;
  }
}
