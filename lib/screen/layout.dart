import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Widget? child;
  Layout({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}