import 'dart:convert';

import 'package:flutter_app/Model/user_model.dart';
import 'package:http/http.dart';

class HttpService {
  // URL that we get the data
  final String postsURL = "https://jsonplaceholder.typicode.com/photos";

  Future<List<User>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<User> users = body
          .map(
            (dynamic item) => User.fromJson(item),
          )
          .toList();

      return users;
    } else {
      throw "Can't get posts.";
    }
  }
}
