import 'package:flutter/material.dart';
import 'pages/user.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('main page')),
      body: Center(child: TextButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
      }, child: const Text('open second page'))),
    );
  }
}



void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}