import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final int _id;

  const SecondScreen(this._id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('second page')),
      body: Center(child: TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text('back'))),
    );
  }
}