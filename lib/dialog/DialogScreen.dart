import 'package:flutter/material.dart';
import 'package:examen_flutter/presentation/homescreen/HomePresenter.dart';
import 'package:examen_flutter/presentation/homescreen/HomeView.dart';
import 'package:examen_flutter/presentation/settings/SettingsScreen.dart';
import 'package:examen_flutter/model/data.dart';

class DialogScreen extends StatefulWidget {
  @override
  _DialogScreenState createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen>{
  HomePresenter _homePresenter;
  List<Data> data = [];
  bool _isLoading = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _homePresenter.fetchData();
  }

  @override
  openSettingsScreen(int position) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return SettingsScreen(position);
    }));
  }

  @override
  showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  showError() {
    setState(() {
      _isError = true;
    });
  }

  @override
  showUsers(List<Data> data) {
    setState(() {
      this.data = data;
    });
  }

  buildBody() {
    return SimpleDialog(
      title: const Text('La respuesta es: '),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () { ; },
          child: const Text('Treasury department'),
        ),
        SimpleDialogOption(
          onPressed: () { ; },
          child: const Text('State department'),
        ),
      ],
    );
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
  }
