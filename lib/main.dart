import 'package:complex_json_serilization/screens/district_list_page.dart';
import 'package:complex_json_serilization/screens/home_page.dart';
import 'package:complex_json_serilization/screens/json_serealization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: DistrictList(),
      home: JsonSerealization(),
    );
  }
}
