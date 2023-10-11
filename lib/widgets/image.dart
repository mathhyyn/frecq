import 'package:flutter/material.dart';
import '../api/user.dart' show usrDB;

class ImageWidget extends StatelessWidget {
  final String _userName;
  final int _imageNum;
  final String _imageInfo;

  const ImageWidget(this._userName, this._imageNum, this._imageInfo, {super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: const Color.fromARGB(50, 0, 250, 154),
          child: Column(
            children: [
              Image.network("${usrDB.serv}/$_userName/img_$_imageNum.jpg"),
              Text(_imageInfo),
            ],
          ),
        ),
      ),
    );
  }
}
