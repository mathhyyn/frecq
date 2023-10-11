import 'package:flutter/material.dart';
import '../api/user.dart' show usrDB;
import 'image.dart';

class SecondScreen extends StatelessWidget {
  final int _id;
  final String date1 = "13.08.2002";
  final String date2 = "13.08.2002";

  const SecondScreen(this._id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id.toString()),
      ),
      body: Center(
        child: RawScrollbarExample(_id),
      ),
    );
  }
}

class RawScrollbarExample extends StatefulWidget {
  final int _id;
  const RawScrollbarExample(this._id, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<RawScrollbarExample> createState() => _RawScrollbarExampleState(_id);
}

class _RawScrollbarExampleState extends State<RawScrollbarExample> {
  Future<List<dynamic>> getUserById(int id) async {
    return await usrDB.getUserById(id);
  }

  Future<List<dynamic>> getAllImages(int id) async {
    return await usrDB.getAllImages(id);
  }

  final int _id;
  List<dynamic> dataList1 = [];
  List<dynamic> dataList2 = [];
  final String date1 = "13.08.2002";
  final String date2 = "13.08.2002";
  final ScrollController _firstController = ScrollController();
  _RawScrollbarExampleState(this._id);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Выполните запрос и получите данные
      dataList1 = await getUserById(_id);
      dataList2 = await getAllImages(_id);
    } catch (error) {
      // Обработка ошибок
    }

    if (mounted) {
      // Обновляем состояние виджета после получения данных
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (dataList1.isEmpty) {
      // Возвращаем индикатор загрузки или другой виджет пока запрос выполняется
      return const CircularProgressIndicator();
    } else {
      // Возвращаем виджет с полученными данными
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        List<int> images = <int>[];
        for (int i = 0; i < 50; i++) {
          images.add(i);
        }
        /* something */

        return Container(
            color: const Color.fromARGB(50, 0, 250, 154),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text('Name: ${dataList1[0]["name"]}',
                        style: const TextStyle(fontSize: 25.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                        'Date of first recognition: ${dataList1[0]["dateandtimeoffirstrecognition"]}'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                        'Date of last recognition: ${dataList1[0]["dateandtimeoflastrecognition"]}'),
                  ),
                ),
                Expanded(
                    /*
                * images list style
                */
                    child: Scrollbar(
                        thumbVisibility: true,
                        controller: _firstController,
                        child: ListView.builder(
                            controller: _firstController,
                            itemCount: dataList2.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ImageWidget(
                                  _id, dataList1[0]["name"], dataList2[index]);
                            }))),
              ],
            ));
      });
    }
  }
}
