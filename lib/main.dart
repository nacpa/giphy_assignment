import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newwww/home/view/view.dart';
import 'package:newwww/theme/theme.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      title: 'Notion',

      home: Home(),
    );
  }
}




