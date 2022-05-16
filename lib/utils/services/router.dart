import 'package:flutter/material.dart';
import 'package:personal_website/screen/art/art.dart';
import 'package:personal_website/screen/builder/builder.dart' as screen;
import 'package:personal_website/screen/launcher/launcher.dart';
import 'package:personal_website/screen/home/home.dart';
import 'package:personal_website/models/generate_page_route.dart';
import 'package:personal_website/screen/test/test.dart';
import '../routes_name.dart';


  Route<dynamic> generateRoute(RouteSettings settings) {
    if(settings.name==RoutesName.HOME) {
      return GeneratePageRoute(
        widget: Home(), routeName: settings.name!);
    } else if(settings.name!.contains(RoutesName.ART)) {
      return GeneratePageRoute(
        widget: const Art(), routeName: settings.name!);
    } else if(settings.name==RoutesName.LAUCHER) {
      return GeneratePageRoute(
            widget: const Launcher(), routeName: settings.name!);
    } else if(settings.name==RoutesName.BUILDER) {
      return GeneratePageRoute(
          widget: const screen.Builder(), routeName: settings.name!);
    } else if(settings.name==RoutesName.TEST) {
      return GeneratePageRoute(
          widget: Test(list:settings.arguments as List<Widget>), routeName: settings.name!);
    } else {
      return GeneratePageRoute(
            widget: Home(), routeName: settings.name!);
    }
    }
