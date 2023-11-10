
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
News news;
NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage??"",
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.3,
              fit: BoxFit.fill,
              placeholder: (context, url) => CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 15,),
          Text(news.author??"",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color:Colors.grey )),
          SizedBox(height: 10,),
          Text(news.title??"",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color:Colors.black )),
          Text(news.publishedAt??"",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color:Colors.grey ),textAlign: TextAlign.end),
          // Container(
          //   clipBehavior: Clip.antiAlias,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Image.network(news.urlToImage??""),
          // )
        ],
      ),
    );
  }
}
