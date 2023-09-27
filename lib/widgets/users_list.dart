import 'package:flutter/material.dart';
import 'user.dart';
import 'image.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('users list page')),
      body: Column( children: [
        TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: const Text('back')),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen(1)));
        }, child: const Text('user page')),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen(5)));
        }, child: const Text('image widget'))
      ]),
    );
  }
}