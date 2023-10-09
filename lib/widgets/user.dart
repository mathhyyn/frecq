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
  const RawScrollbarExample(this._id,{super.key});

  @override
  State<RawScrollbarExample> createState() => _RawScrollbarExampleState(_id);
}

class _RawScrollbarExampleState extends State<RawScrollbarExample> {
  final int _id;
  final ScrollController _firstController = ScrollController();
  _RawScrollbarExampleState (this._id);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: <Widget>[
              SizedBox(
                  width: constraints.maxWidth,
                  // When using the PrimaryScrollController and a Scrollbar
                  // together, only one ScrollPosition can be attached to the
                  // PrimaryScrollController at a time. Providing a
                  // unique scroll controller to this scroll view prevents it
                  // from attaching to the PrimaryScrollController.
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _firstController,
                    child: ListView.builder(
                        controller: _firstController,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return ImageWidget(_id, index);
                        }),
                  )),
            ],
          );
        });
  }
}
