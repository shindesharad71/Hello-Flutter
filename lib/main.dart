import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();

}

class HomePageState extends State<HomePage> {
  Map data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull(
            "https://opentdb.com/api.php?amount=10&category=18&difficulty=medium&type=boolean"),
        headers: {
          "Accept": "application/json"
        }
    );

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
        title: new Text("Flutter JSON Parsing"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(5.0),
        child: new ListView.builder(
        itemCount: data["results"].length,
        itemBuilder: (BuildContext context, int index) {
          Text temp;
          if(data["results"][index]["question"] != null) {
            temp = new Text(data["results"][index]["question"], style: new TextStyle(fontSize: 20.0));
          }else{
            temp = new Text("null");
          }
          return new Card(
              child: temp
          );
        },
      ),
    )
    );
  }
}