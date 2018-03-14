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

  print(data);
  return "Success";
  }
}