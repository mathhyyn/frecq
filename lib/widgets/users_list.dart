import 'package:flutter/material.dart';
import 'user.dart';
import 'image.dart';

const List<int> users = <int>[1, 2];

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('users list page')),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen(users[index])));
                    },
                    child: Text('user page $index'))
              ],
            );
          }),
    );
  }
}
