import 'package:flutter/material.dart';
import 'widgets/users_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('main page')),
      body: Center(
          child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UsersListPage()));
        },
        style: TextButton.styleFrom(
            foregroundColor: Colors.red,
            elevation: 2,
            backgroundColor: Colors.amber),
        child: const Text('open users list'),
      )),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      //brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
      scaffoldBackgroundColor: const Color.fromARGB(250, 0, 250, 154),
    ),
    home: const MainScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
