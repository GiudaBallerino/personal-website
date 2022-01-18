import 'package:flutter/material.dart';
import 'models/page.dart';

//DEFAULT COLOR
// const kTextColor = Color(0xFF2a1e59);
//const kBackgroundColor = Color(0xFFE0E5EC);
// const kDarkShadow = Color(0xFFA3B1C6);
// const kLightShadow = Color(0xFFFFFFFF);

// const kTextColor = Color(0xFFE0E5EC);
// const kBackgroundColor = Color(0xFF1b5e4f);
// const kDarkShadow = Color(0xFF175043);
// const kLightShadow = Color(0xFF1f6c5b);
// const kDarkGradient = Color(0xFF185557);
// const kLightGradient = Color(0xFF1d6555);

const kTextColor = Color(0xFFE0E5EC);
const kBackgroundColor = Color(0xFF1d1d1d);
const kDarkShadow = Color(0xFF191919);
const kLightShadow = Color(0xFF212121);
const kDarkGradient = Color(0xFF1a1a1a);
const kLightGradient = Color(0xFF1f1f1f);
const kSecondaryColor = Color(0xFFffae00);
const kTertiaryColor=Color(0xFF682ae9);

List<Pages> pageList=[
  Pages(id: "art",name:".art()",route:"/launch",type:PagesType.impress,logo: Icon(Icons.brush,color: kTextColor,)),
  //Pages(id: "about",name:".about()",route:"/about",type:PagesType.contact,logo: Icon(Icons.account_circle)),
  Pages(id: "home-page",name:".home()",route:"/home",type:PagesType.home, logo: Icon(Icons.home,color: kTextColor)),
  //Pages(id: "work",name:".work()",route:"/work",type:PagesType.work,logo: Icon(Icons.engineering)),
  //Pages(id: "blog", name:".blog()",route:"/blog",type:PagesType.blog,logo: Icon(Icons.description)),
];