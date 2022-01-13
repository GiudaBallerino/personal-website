import 'package:flutter/material.dart';
import 'package:personal_website/screen/art/art.dart';
import 'package:personal_website/screen/art/launcher.dart';
import 'package:personal_website/screen/home/home.dart';
import 'package:personal_website/utils/models/generate_page_route.dart';
import '../routes_name.dart';


  Route<dynamic> generateRoute(RouteSettings settings) {
    if(settings.name==RoutesName.HOME) {
      return GeneratePageRoute(
        widget: Home(), routeName: settings.name!);
    } else if(settings.name!.contains(RoutesName.ART)) {
      return GeneratePageRoute(
        widget: Art(), routeName: settings.name!);
    } else if(settings.name==RoutesName.LAUCHER) {
      return GeneratePageRoute(
            widget: Launcher(), routeName: settings.name!);
    } else {
      return GeneratePageRoute(
            widget: Home(), routeName: settings.name!);
    }
    }
