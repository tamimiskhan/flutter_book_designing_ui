import 'package:flutter/material.dart';
import 'package:flutter_book_designing_ui/constants/color_constant.dart';
import 'package:flutter_book_designing_ui/screen/home_screen.dart';
import 'package:flutter_book_designing_ui/screen/selected_book_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: kMainColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      home: HomeScreen(),
      routes: {
        "/homeScreen":(_)=>new HomeScreen(),
      },
    );
  }
}
