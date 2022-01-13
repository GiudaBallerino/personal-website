import 'package:flutter/material.dart';

import 'models/page.dart';

//DEFAULT COLOR
const kTextColor = Color(0xFF2a1e59);
const kBackgroundColor = Color(0xFFE0E5EC);
const kDarkShadow = Color(0xFFA3B1C6);
const kLightShadow = Color(0xFFFFFFFF);

List<Pages> pageList=[
  Pages(id: "art",name:".art()",route:"/launch",type:PagesType.impress,logo: Icon(Icons.brush)),
  //Pages(id: "about",name:".about()",route:"/about",type:PagesType.contact,logo: Icon(Icons.account_circle)),
  Pages(id: "home-page",name:".home()",route:"/home",type:PagesType.home, logo: Icon(Icons.home)),
  //Pages(id: "work",name:".work()",route:"/work",type:PagesType.work,logo: Icon(Icons.engineering)),
  //Pages(id: "blog", name:".blog()",route:"/blog",type:PagesType.blog,logo: Icon(Icons.description)),
];