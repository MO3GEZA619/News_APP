import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/taps/tap_contaner.dart';
import '../api_manager.dart';
import '../model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routename = 'CD';
  Category category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<SourceResponse>(
          future: ApiManager.getSource(widget.category.id),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text("Somthing went wrong"),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSource(widget.category.id);
                        setState(() {});
                      },
                      child: Text('Try Agin'))
                ],
              );
            }
            if (snapshot.data?.status != 'ok') {
              return Column(
                children: [
                  Text(snapshot.data?.message ?? ""),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSource(widget.category.id);
                        setState(() {});
                      },
                      child: Text('Try Agin'))
                ],
              );
            }
            var sourceList = snapshot.data?.sources ?? [];
            return TapContaner(SourceList: sourceList);
          })),
    );
  }
}
