import 'package:flutter/material.dart';
import 'user.dart';
import '../api/user.dart' show usrDB;

const List<int> users = <int>[1, 2, 3, 666];

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  Future<List<dynamic>> getUsersList() async {
    return await usrDB.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('users list page')),
        /* виджет загрузки для StatelessWidget; для асинхронных запросов для Stateful - пользуйтесь setState(), gpt в помощь */
        body: FutureBuilder<List<dynamic>>(
          future: getUsersList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Ошибка: ${snapshot.error}');
            } else {
              List<dynamic> dataList = snapshot.data!;
              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondScreen(
                                        dataList[index]
                                            ["identifiedpersonid"])));
                          },
                          child: Text('${dataList[index]["name"]}'))
                    ],
                  );
                },
              );
            }
          },
        ));
  }
}
