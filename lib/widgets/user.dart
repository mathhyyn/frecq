import 'package:flutter/material.dart';
import '../api/user.dart' show usrDB;
import 'image.dart';


class SecondScreen extends StatelessWidget {
  final int _id;

  final String date1 = "13.08.2002";
  final String date2 = "13.08.2002";


  Future<List<dynamic>> getUserById(int _id) async {
    return await usrDB.getUserById(_id);
  }
  const SecondScreen(this._id, {super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: getUserById(_id),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else {
            List<dynamic> dataList1 = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: Center(child:Text('${dataList1[0]["name"]}')),
              ),
              body: Center(
                child: RawScrollbarExample(_id),
              ),
            );
          }
        }
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
  Future<List<dynamic>> getUserById(int _id) async {
    return await usrDB.getUserById(_id);
  }

  Future<List<dynamic>> getAllImages(int _id) async {
    return await usrDB.getAllImages(_id);
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
            return Column(
                  children: <Widget>[
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
                                  return ImageWidget(_id, dataList2[index]["imageid"]);
                                }))),
                  ],
                );
          });
    }
  }
}
