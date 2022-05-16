import 'package:flutter/material.dart';
import 'package:shop_project/modules/on_boarding_screen/on_boardin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnBoardinScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}
