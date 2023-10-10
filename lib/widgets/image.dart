import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final int _userId;
  final int _imageId;

  const ImageWidget(this._userId, this._imageId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(50, 0, 250, 154),
        child: Text("image $_imageId ($_userId)"));
  }
}
