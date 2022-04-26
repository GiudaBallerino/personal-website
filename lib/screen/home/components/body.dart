import 'package:flutter/material.dart';
import 'package:personal_website/models/letter.dart';
import 'package:personal_website/utils/constant.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Letter> text = [
    Letter(letter: "C", isHover: false, color: kTextColor),
    Letter(letter: "i", isHover: false, color: kTextColor),
    Letter(letter: "a", isHover: false, color: kTextColor),
    Letter(letter: "o", isHover: false, color: kTextColor),
    Letter(letter: ",", color: kTextColor),
    Letter(letter: "\n", color: kTextColor),
    Letter(letter: "S", isHover: false, color: kTextColor),
    Letter(letter: "o", isHover: false, color: kTextColor),
    Letter(letter: "n", isHover: false, color: kTextColor),
    Letter(letter: "o", isHover: false, color: kTextColor),
    Letter(letter: " ", color: kTextColor),
    Letter(letter: "L", color: kTertiaryColor),
    Letter(letter: "o", isHover: false, color: kTextColor),
    Letter(letter: "r", isHover: false, color: kTextColor),
    Letter(letter: "i", isHover: false, color: kTextColor),
    Letter(letter: "s", isHover: false, color: kTextColor),
    Letter(letter: ",", color: kTextColor),
    Letter(letter: "\n", color: kTextColor),
    Letter(letter: "F", isHover: false, color: kTextColor),
    Letter(letter: "l", isHover: false, color: kTextColor),
    Letter(letter: "u", isHover: false, color: kTextColor),
    Letter(letter: "t", isHover: false, color: kTextColor),
    Letter(letter: "t", isHover: false, color: kTextColor),
    Letter(letter: "e", isHover: false, color: kTextColor),
    Letter(letter: "r", isHover: false, color: kTextColor),
    Letter(letter: " ", color: kTextColor),
    Letter(letter: "d", isHover: false, color: kTextColor),
    Letter(letter: "e", isHover: false, color: kTextColor),
    Letter(letter: "v", isHover: false, color: kTextColor),
    Letter(letter: "e", isHover: false, color: kTextColor),
    Letter(letter: "l", isHover: false, color: kTextColor),
    Letter(letter: "o", isHover: false, color: kTextColor),
    Letter(letter: "p", isHover: false, color: kTextColor),
    Letter(letter: "e", isHover: false, color: kTextColor),
    Letter(letter: "r", isHover: false, color: kTextColor),
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.only(left: size.width*0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                children: List.generate(
              text.length,
              (index) => TextSpan(
                text: text[index].letter,
                style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: getColor(text[index]),
                ),
                onEnter: (_) => setState(() => text[index].isHover =
                    text[index].isHover != null ? true : null),
                onExit: (_) => setState(() => text[index].isHover =
                    text[index].isHover != null ? false : null),
              ),
            )),
          ),
        ],
      ),
    );
  }

  Color getColor(Letter l) {
    if (l.isHover != null) {
      return l.isHover! ? kSecondaryColor : l.color;
    } else {
      return l.color;
    }
  }
}
