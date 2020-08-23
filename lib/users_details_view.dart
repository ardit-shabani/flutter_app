import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/user_model.dart';
import 'package:photo_view/photo_view.dart';
import 'image_full_screen.dart';
import 'API/http_service.dart';

class UserDetailsView extends StatelessWidget {
  final User user;

  UserDetailsView({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  // This Card includes an Image, ID, Title and Album ID.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Click Image to see in Full Screen "),
                        subtitle: Text("You can Zoom In / Zoom Out"),
                        // Here if we click on the image, we send the user to another view that sees the same picture but full screen.
                        // Then he can do Zoom In/zoom Out
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ImageFullScreen(
                              user: user,
                            ),
                          ),
                        ),
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 30,
                            minHeight: 30,
                            maxWidth: 100,
                            maxHeight: 100,
                          ),
                          child: Image.network(user.url),
                        ),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text(user.id.toString()),
                      ),
                      ListTile(
                        title: Text("Title"),
                        subtitle: Text("${user.title}"),
                      ),
                      ListTile(
                        title: Text("Album ID"),
                        subtitle: Text(user.albumId.toString()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
