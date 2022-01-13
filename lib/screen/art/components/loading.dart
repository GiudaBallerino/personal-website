import 'package:flutter/material.dart';
import 'package:personal_website/utils/constant.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        //todo anima e rendi più personalizzabile
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.width * 0.1,
            width: size.width * 0.1,
            decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: kDarkShadow,
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(3, 3),
                  ),
                  BoxShadow(
                    color: kLightShadow,
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(-3, -3),
                  ),
                ]),
            child: const Icon(Icons.brush),
          ),
        ],
      ),
    );
  }
}
