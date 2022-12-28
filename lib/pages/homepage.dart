import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_api/helper/helper.dart';

import '../model/articlemodel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName='/';
  @override
  State<HomePage> createState() => _HomePageState();
}
String? initaplink;
class _HomePageState extends State<HomePage> {
  List<ArticleModel> articles= [];
  bool loading=true;
  @override
  void initState() {
    getNews();
  }
  getNews()async{
    TechNews news= TechNews();
    await news.getnews();
    articles=news.techNews;
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('News',style: TextStyle(color: Colors.blue),),
            Text('App',style: TextStyle(color: Colors.amber),)
          ],
        ),
      ),
      body: loading? Center(
        child: CircularProgressIndicator(),
      ):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder:(context, index){
              return Column(
                children: [
                  Image.network(
                    '${articles[index].urltoimage}'
                    ,height: 200,
                    fit: BoxFit.cover
                ),
                  const SizedBox(height: 10,),
                  Text('${articles[index].title}',style: TextStyle(fontSize: 20, color: Colors.black)),
                  const SizedBox(height: 10,),
                  const Divider(color: Colors.black,),
                ],
              );
            }
        ),
      ),
    );
  }
}
