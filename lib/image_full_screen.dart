import 'package:flutter/cupertino.dart';
import 'package:flutter_app/Model/user_model.dart';

import 'package:photo_view/photo_view.dart';

class ImageFullScreen extends StatelessWidget {
  final User user;

  ImageFullScreen({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      // This PhotoView allow the option to zoom in/zoom out on the image.
      child: PhotoView(
        imageProvider: NetworkImage(user.url),
      ),
    );
  }
}
