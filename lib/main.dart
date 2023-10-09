/*import 'package:flutter/material.dart';
import 'widgets/user.dart';
import 'widgets/users_list.dart';*/
/*
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('main page')),
      body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsersListPage()));
              },
              child: const Text('open users list'))),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => const MainScreen(),
      '/list': (BuildContext context) => const UsersListPage(),
      '/user': (BuildContext context) => const SecondScreen(-1)
    },
    onGenerateRoute: (routeSettings) {
      var path = routeSettings.name?.split('/');

      if (path?[1] == "user") {
        return MaterialPageRoute(
          builder: (context) => const SecondScreen(1/*_id: path[2]*/),
          settings: routeSettings,
        );
      }
    },
  ));
}
*/

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