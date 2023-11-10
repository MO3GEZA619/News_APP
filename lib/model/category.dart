import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';

class Category {
  String id;
  String title;
  String imageUrl;
  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.color,
      required this.imageUrl});

  static List<Category> getCategories() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          color: appTheme.redColor,
          imageUrl: 'assets/ball.png'),
      Category(
          id: 'general',
          title: 'General',
          color: appTheme.darkBlueColor,
          imageUrl: 'assets/Politics.png'),
      Category(
          id: 'health',
          title: 'Health',
          color: appTheme.pinkColor,
          imageUrl: 'assets/health.png'),
      Category(
          id: 'business',
          title: 'Business',
          color: appTheme.brownColor,
          imageUrl: 'assets/bussines.png'),
      Category(
          id: 'entertainment',
          title: 'Entertainment ',
          color: appTheme.blueColor,
          imageUrl: 'assets/environment.png'),
      Category(
          id: 'science',
          title: 'Science',
          color: appTheme.yellowColor,
          imageUrl: 'assets/science.png'),
      Category(
          id: 'technology',
          title: 'Technology',
          color: appTheme.darkBlueColor,
          imageUrl: 'assets/technology.png'),
    ];
  }
}
