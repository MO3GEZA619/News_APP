import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api_constants.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager{
  static Future<SourceResponse> getSource(String categoryId) async {

    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=678f8400c379462b9de6ec626b1cc40e
    */

    Uri url=Uri.https(ApiConstants.baseUrl,ApiConstants.SourceApi,{
      'apiKey': '678f8400c379462b9de6ec626b1cc40e',
      'category' : categoryId
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }
    catch(e){
      throw e;
    }
  }

  static Future<NewsResponse> getNewsBySource(String sourceId) async {

    /*
    https://newsapi.org/v2/everything?q=apple&from=2023-10-18&to=2023-10-18&sortBy=popularity&apiKey=678f8400c379462b9de6ec626b1cc40e
    */

    Uri url=Uri.https(ApiConstants.baseUrl,ApiConstants.NewsApi,{
      'apiKey': '678f8400c379462b9de6ec626b1cc40e',
      'sources' : sourceId
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }

}