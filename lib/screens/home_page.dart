import 'package:complex_json_serilization/constants/app_text.dart';
import 'package:complex_json_serilization/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Boilerplate
  String url;
  List data = [];
  var response;
  List<User> userList;
  bool isLoading = true;

  Future<List<User>> getUsers() async {
    url = "http://jsonplaceholder.typicode.com/users";
    response = await http.get(url);
    data = json.decode(response.body);
    setState(() {
      userList = data.map((json) => User.fromJson(json)).toList();
      isLoading = false;
    });
    return userList;
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              // onTap: () {
              //   if (getUsers() == null) {
              //     return CircularProgressIndicator();
              //   } else {
              //     return getUsers();
              //   }
              // },
              child: Icon(
                Icons.refresh,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: isLoading == true
          ? Center(
              child: LinearProgressIndicator(
                backgroundColor: Colors.tealAccent,
              ),
            )
          : ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text(userList[index].name),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userList[index].username),
                            Text(userList[index].email),
                            Text(userList[index].address.city),
                            Text("Geo : " +
                                userList[index].address.geo.lat +
                                " " +
                                userList[index].address.geo.lng),
                            Row(
                              children: [
                                Text(userList[index].address.geo.lat),
                                Text(userList[index].address.geo.lng),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
