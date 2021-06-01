import 'package:complex_json_serilization/Json_Serealization_package/json_services.dart';
import 'package:complex_json_serilization/Json_Serealization_package/model_for_user/user.dart';
import 'package:flutter/material.dart';

class JsonSerealization extends StatefulWidget {
  @override
  _JsonSerealizationState createState() => _JsonSerealizationState();
}

class _JsonSerealizationState extends State<JsonSerealization> {
  //To get the decoded data from JsonSercice we have to make an instance object of that class
  UserService userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Serealization with packages"),
      ),
      body: FutureBuilder(
        future: userService.getUsers(),
        builder: (context, snapshots) {
          List<UserModel> userList = snapshots.data;
          return snapshots.hasData
              ? ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    if (snapshots.hasError) {
                      return Center(
                        child: Text(snapshots.error),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            userList[index].name,
                          ),
                          subtitle: Text(
                            userList[index].address.city,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "lat: " + userList[index].address.geo.lat,
                              ),
                              Text(
                                "lng: " + userList[index].address.geo.lng,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
