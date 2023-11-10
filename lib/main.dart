import 'package:flutter/material.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/my_theme.dart';
import 'Home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (context) => HomeScreen(),


      },
      initialRoute: HomeScreen.routename,
      theme: appTheme().lightTheme,
    );
  }
}





