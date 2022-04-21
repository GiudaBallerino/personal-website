import 'package:flutter/material.dart';
import 'models/page.dart';

//DEFAULT COLOR

//const kTextColor = Color(0xFFE0E5EC);
//const kBackgroundColor = Color(0xFF1d1d1d);
const kTextColor = Color(0xFF686868);
const kBackgroundColor = Color(0xFFdbdbdb);
const kAltBackgroundColor = Color(0xFFeeedeb);
const kPrimaryColor = Color(0xFFf03138);
const kDisabledColor =Color(0xFF7d7e80);

const kDarkShadow = Color(0xFF191919);
const kLightShadow = Color(0xFF212121);
const kDarkGradient = Color(0xFFA3B1C6);
const kLightGradient = Color(0xFFFFFFFF);
const kSecondaryColor = Color(0xFFffae00);
const kTertiaryColor=Color(0xFF682ae9);

List<Pages> pageList=[
  Pages(id: "art",name:".art()",route:"/launch",type:PagesType.impress,logo: Icon(Icons.brush,color: kTextColor,)),
  //Pages(id: "about",name:".about()",route:"/about",type:PagesType.contact,logo: Icon(Icons.account_circle)),
  Pages(id: "home-page",name:".home()",route:"/home",type:PagesType.home, logo: Icon(Icons.home,color: kTextColor)),
  //Pages(id: "work",name:".work()",route:"/work",type:PagesType.work,logo: Icon(Icons.engineering)),
  //Pages(id: "blog", name:".blog()",route:"/blog",type:PagesType.blog,logo: Icon(Icons.description)),
];