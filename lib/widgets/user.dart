import 'package:flutter/material.dart';

import 'image.dart';

const List<String> users = <String>["Tom", "Alice", "Bob", "Sam", "Kate"];

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
        child: RawScrollbarExample(this._id),
      ),
    );
  }
}

class RawScrollbarExample extends StatefulWidget {
  final int _id;
  const RawScrollbarExample(this._id, {super.key});

  @override
  State<RawScrollbarExample> createState() => _RawScrollbarExampleState(_id);
}

class _RawScrollbarExampleState extends State<RawScrollbarExample> {
  final int _id;
  final String date1 = "13.08.2002";
  final String date2 = "13.08.2002";
  final ScrollController _firstController = ScrollController();
  _RawScrollbarExampleState(this._id);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          color: Color.fromARGB(50, 0, 250, 154),
          child:Column(

        children: <Widget>[
          Padding(

            padding: EdgeInsets.all(8),
            child: Align(

              alignment: Alignment.topCenter,
              child: Text('Petya', style: TextStyle(fontSize: 25.0),),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text('$date1'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text('$date2'),
            ),
          ),
          Expanded(
              flex: 1,
              child: Scrollbar(
                thumbVisibility: true,
                controller: _firstController,
                child: ListView.builder(
                    controller: _firstController,
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return ImageWidget(_id, index);
                    }),
              )),
        ],
      ));
    });
  }
}
