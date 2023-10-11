import 'package:flutter/material.dart';
import '../api/user.dart' show usrDB;

class ImageWidget extends StatelessWidget {
  final int _userId;
  final String _userName;
  late final int _imageId;
  late final int _imageNumber;
  late final String _imageDate;

  ImageWidget(this._userId, this._userName, image, {super.key}) {
    print(image);
    _imageId = image["imageid"];
    _imageNumber = image["imagenumber"];
    _imageDate = image["dateandtime"];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(50, 0, 250, 154),
        child: Text("image $_imageId ($_userId)"));
  }
}
