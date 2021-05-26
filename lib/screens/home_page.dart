import 'package:complex_json_serilization/constants/app_text.dart';
import 'package:complex_json_serilization/model/user_model.dart';
import 'package:flutter/material.dart';
//  import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Boilerplate
String url;
List data = [];
var response;
List<User> userList;

Future getUsers() async {
  url = "http://jsonplaceholder.typicode.com/users";
  // response = await
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          AppText.homepageTitle.toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
