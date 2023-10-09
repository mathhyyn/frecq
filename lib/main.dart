import 'package:flutter/material.dart';
import 'widgets/users_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('main page')),
      body: Center(child: TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UsersListPage()));
      }, child: const Text('open users list'))),
    );
  }
}



void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}