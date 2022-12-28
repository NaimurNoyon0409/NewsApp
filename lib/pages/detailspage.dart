import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  final String title,des,url,urlToImage,content;

  const NewsDetails({Key? key,required this.title,required this.des,required this.url,required this.urlToImage, required this.content}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'),backgroundColor: Colors.black,),
        body: Column(
          children: [
            Image.network(
                '${widget.urlToImage}'
                ,height: 200,
                fit: BoxFit.cover
            ),
            SizedBox(height: 20,),
            Text('Title : ${widget.title}',style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            Text('Description : ${widget.des}'),
            SizedBox(height: 20,),
            Text('Content : ${widget.content}'),


          ],
        ),
    );
  }
}
