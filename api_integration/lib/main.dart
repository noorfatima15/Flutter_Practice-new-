import 'package:flutter/material.dart';

import 'api.dart';

void main() {
  runApp(const MyApp());
}
//api is used for backend data

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Api Integration",
      home: Scaffold(
        body: Api(),
      ),
    );
  }
}
