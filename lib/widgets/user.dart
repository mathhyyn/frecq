import 'package:flutter/material.dart';

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
  final int _id;
  final String date1 = "13.08.2002";
  final String date2 = "13.08.2002";
  final ScrollController _firstController = ScrollController();
  _RawScrollbarExampleState(this._id);

  @override
  Widget build(BuildContext context) {
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
              const Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Petya',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text('Date of first recognition: $date1'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text('Date of last recognition: $date2'),
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
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ImageWidget(_id, images[index]);
                    }),
              )),
            ],
          ));
    });
  }
}
