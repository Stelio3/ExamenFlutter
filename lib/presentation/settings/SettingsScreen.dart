import 'package:examen_flutter/presentation/homescreen/HomePresenter.dart';
import 'package:examen_flutter/presentation/homescreen/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:examen_flutter/model/data.dart';
import 'package:http/http.dart' as network;

class SettingsScreen extends StatefulWidget {
  final int position;

  SettingsScreen(this.position);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<Data> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pregunta ${widget.position}"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Question!!"
            ),
            RaisedButton(
              child: const Text('Answer 1'),
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                // Perform some action
              },
            ),
            RaisedButton(
              child: const Text('Answer 2'),
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                // Perform some action
              },

            ),
            RaisedButton(
              child: const Text('Answer 3'),
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                // Perform some action
              },
            ),
          ],
        ),
      )
    );
  }
}
