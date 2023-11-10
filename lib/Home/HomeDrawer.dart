import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories =1;
  static const int Settings =2;
  Function onDrawerItemClick;
  HomeDrawer({required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.1),
          color: Theme.of(context).primaryColor,
          child: Text('News App!',textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 30,)),
        ),
        SizedBox(height: 15,),
        InkWell(
          onTap: (){
            onDrawerItemClick(categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 10,),
                Text('Categories',
                  style:Theme.of(context).textTheme.titleMedium,)

              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick(Settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 10,),
                Text('Settings',
                  style:Theme.of(context).textTheme.titleMedium,)

              ],
            ),
          ),
        ),

      ],
    );
  }
}
