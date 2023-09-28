import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final int _id;

  const ImageWidget(this._id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('image widget')),
      body: Center(child: TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text('back'))),
    );
  }
}