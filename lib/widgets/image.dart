import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final int _id;
  final int index;

  const ImageWidget(this._id, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Color.fromARGB(50, 0, 250, 154),
          child: Text("aboba")
    );
  }
}