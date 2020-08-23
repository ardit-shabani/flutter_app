import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/API/http_service.dart';
import 'package:flutter_app/Model/user_model.dart';
import 'package:flutter_app/users_details_view.dart';

class Users extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users")
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            List<User> posts = snapshot.data;
            return ListView(
              //  Here in a list item are included a small photo, title and ID.
              children: posts
                  .map(
                    (User user) => ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.thumbnailUrl),
                      ),
                      title: Text(user.title),
                      subtitle: Text("${user.id}"),
                      // Here we push the data into another view, so called UserDetailsView
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserDetailsView(
                            user: user,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            // Until the list is loaded with data, we display this to show the user that is in progress.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
