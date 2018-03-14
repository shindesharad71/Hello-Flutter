import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  Map data;
  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<String> getdata() async {
    var response = await http.get(url,
    headers: {
      "Accept": "application/json"
    });

  this.setState(() {
    data = JSON.decode(response.body);
  });

  return "Success!";
  }

   @override
  void initState() {
    this.getData();
  }

  
@override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Listviews"),
    ),
    body: new ListView.builder(
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        Text temp;
        if(data[index] != null) {
          temp = new Text(data["title"]);
        } else {
          temp = new Text("null");
        }
        return new Card(
          child: temp,
        );
      },
    ),
  );
}

}