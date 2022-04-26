import 'package:flutter/material.dart';

enum PagesType{
  home,
  impress,
  contact,
  work,
  article,
  blog,
}

class Pages{//todo trovare nome migliore
  String id;
  String name;
  String route;
  PagesType type;
  Icon logo;

  Pages({
    required this.id,
    required this.name,
    required this.route,
    required this.type,
    required this.logo,
  });
}