import 'package:complex_json_serilization/constants/app_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
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
