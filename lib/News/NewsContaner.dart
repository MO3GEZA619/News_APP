import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/News/News_item.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';

class NewsContaner extends StatefulWidget {
  Source source;
  NewsContaner({required this.source});

  @override
  State<NewsContaner> createState() => _NewsContanerState();
}

class _NewsContanerState extends State<NewsContaner> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySource(widget.source.id??""),
        builder: (context,snapshot){
          if (snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor ,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text("SomeThing Went Wrong"),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySource(widget.source.id??"");
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          if(snapshot.data?.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data?.message ?? "SomeThing Went Wrong"),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySource(widget.source.id??"");
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          var newList=snapshot.data?.articles??[];
          return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: newList[index]);
              },
              itemCount: newList.length
              );
        }

    );
  }
}
