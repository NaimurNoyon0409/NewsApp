import 'dart:convert';

import 'package:news_app_api/model/articlemodel.dart';
import 'package:http/http.dart' as http;

class TechNews{
  List <ArticleModel> techNews=[];
  Future<void> getnews() async{
 http.Response response;
 String apilink="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=edcc7209b19340868d5b2c2825c50c58";
 response=await http.get(Uri.parse(apilink));
 var jsondata= jsonDecode(response.body);
 if(jsondata['status']=='ok')
   {
     jsondata['articles'].forEach((element){
       if(element['urlToImage']!=null && element['description']!=null)
       {
         ArticleModel articleModel=ArticleModel(
           title: element['title'],
           authorname: element['author'],
           desc: element['description'],
           content: element['content'],
           url: element['url'],
           urltoimage: element['urlToImage'],
         );
         techNews.add(articleModel);
       }
     });
   }
  }
}