import 'package:complex_json_serilization/Json_Serealization_package/model_for_user/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  String url;
  List data = [];
  var response;
  List<UserModel> userList = [];

  Future<List<UserModel>> getUsers() async {
    url = "http://jsonplaceholder.typicode.com/users";
    response = await http.get(url);
    data = json.decode(response.body);

    userList = data.map((e) => UserModel.fromJson(e)).toList();
    return userList;
  }
}
