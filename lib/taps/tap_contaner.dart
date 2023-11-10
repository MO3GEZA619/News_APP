import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/News/NewsContaner.dart';
import 'package:news_app/taps/tapItem.dart';
import '../model/SourceResponse.dart';

class TapContaner extends StatefulWidget {
  List<Source>SourceList;
  TapContaner({required this.SourceList});

  @override
  State<TapContaner> createState() => _TapContanerState();
}

class _TapContanerState extends State<TapContaner> {
  int SelectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.SourceList.length ,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                SelectedIndex=index;
                setState(() {

                });
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs:
                widget.SourceList.map((sourse) => TapItem(
                    isSelected: SelectedIndex == widget.SourceList.indexOf(sourse),
                    source:  sourse
                )).toList()

            ),
            Expanded(child: NewsContaner(source: widget.SourceList[SelectedIndex]))
          ],
        ));
  }
}
