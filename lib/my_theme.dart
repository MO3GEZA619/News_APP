import 'package:flutter/material.dart';


class appTheme {

  static Color redColor = Color (0xffC91C22);
  static Color darkBlueColor = Color (0xff003E90);
  static Color pinkColor = Color (0xffED1E79);
  static Color brownColor = Color (0xffCF7E48);
  static Color blueColor = Color (0xff4882CF);
  static Color yellowColor = Color(0xffF2D352);
  static Color greyColor = Color(0xff4F5A69);
  static Color primaryLight = Color(0xFF39A552);
  static Color darkcolor = Color(0xFF000000);
  static Color whiteColor = Color(0xffF8F8F8);
  ThemeData lightTheme = ThemeData(
      primaryColor: primaryLight,
      appBarTheme: AppBarTheme(
          color: primaryLight,
          centerTitle: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 22,color: Colors.white, fontWeight: FontWeight.w500),
          titleMedium:TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(fontSize: 14,color: Colors.grey, fontWeight: FontWeight.w500),
  ),

  );
}
