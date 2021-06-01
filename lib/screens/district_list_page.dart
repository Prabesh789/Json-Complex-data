import 'package:complex_json_serilization/model/district_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DistrictList extends StatefulWidget {
  @override
  _DistrictListState createState() => _DistrictListState();
}

class _DistrictListState extends State<DistrictList> {
  String url;
  List data = [];
  var response;
  List<District> districtList;
  bool isLoading = true;

  Future<List<District>> getUsers() async {
    try {
      url = "https://data.askbhunte.com/api/v1/districts";
      response = await http.get(url);
      data = json.decode(response.body);
      setState(() {
        districtList = data.map((json) => District.fromJson(json)).toList();
        isLoading = false;
      });
      return districtList;
    } catch (e) {
      return e;
    }
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
        title: Text("Json Complex 03"),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: districtList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      children: <Widget>[
                        Text(districtList[index].titleNep),
                        SizedBox(width: 10),
                        Text(districtList[index].titleEng)
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(districtList[index].bbox[0].toString()),
                          Text(districtList[index].bbox[1].toString()),
                          Text(districtList[index].bbox[2].toString()),
                          Text(districtList[index].bbox[3].toString()),
                          Divider(),
                          Row(
                            children: [
                              Text("Lat: "),
                              Text(districtList[index]
                                  .centroid
                                  .cordinates[0]
                                  .toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Lng: "),
                              Text(districtList[index]
                                  .centroid
                                  .cordinates[1]
                                  .toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
