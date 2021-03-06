import 'package:flutter/material.dart';
import 'package:personal_website/screen/layout.dart';
import 'package:personal_website/utils/constant.dart';
import 'package:personal_website/utils/routes_name.dart';
import 'package:personal_website/utils/services/router.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

void main() {
  configureApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => Layout(child: child),
        onGenerateRoute: generateRoute,
        initialRoute: RoutesName.HOME,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
            // scrollbarTheme: ScrollbarThemeData(
            //     isAlwaysShown: true,
            //     thickness: MaterialStateProperty.all(10),
            //     thumbColor: MaterialStateProperty.all(kBackgroundColor),
            //     radius: const Radius.circular(10),
            //     mainAxisMargin: 10,
            //     crossAxisMargin: 10,
            //     minThumbLength: 100)
        ));
  }
}
