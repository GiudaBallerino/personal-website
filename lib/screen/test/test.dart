import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key,required this.list}) : super(key: key);

  final List<Widget> list;
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.2, vertical: size.height * 0.08),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.list
        ),
      ),
    );
  }
}
