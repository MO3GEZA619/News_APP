import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Settings/SettingsTab.dart';
import 'package:news_app/category/CategoryFragments.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/my_theme.dart';

import 'HomeDrawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'HS';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: appTheme.whiteColor,
            child: Image.asset(
              'assets/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )),
        Scaffold(
          appBar: AppBar(
            title: Text(selectedDrawerItem==HomeDrawe r.Settings?'Settings':
                selectedCategory==null? 'NEWS APP' :
                selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onDrawerItemClick: onDrawerItemClick ),
          ),
          body: selectedDrawerItem==HomeDrawer.Settings?
              SettingsTab():
          selectedCategory==null?
          CategoryFragment(onCategoryClick: onCategoryClick ):
          CategoryDetails(category: selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryClick(Category newSelectedCategory){
    selectedCategory=newSelectedCategory;
    setState(() {

    });

  }

  int selectedDrawerItem=HomeDrawer.categories;
  void onDrawerItemClick(int newSelectedDrawerItem){
    selectedDrawerItem=newSelectedDrawerItem;
    selectedCategory =null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
