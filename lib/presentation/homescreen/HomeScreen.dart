import 'package:flutter/material.dart';
import 'package:examen_flutter/presentation/homescreen/HomePresenter.dart';
import 'package:examen_flutter/presentation/homescreen/HomeView.dart';
import 'package:examen_flutter/presentation/settings/SettingsScreen.dart';
import 'package:examen_flutter/model/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  HomePresenter _homePresenter;
  List<Data> data = [];
  bool _isLoading = true;
  bool _isError = false;

  _HomeScreenState() {
    _homePresenter = HomePresenter(this);
  }

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
    if (_isLoading) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90.0),
        child: CircularProgressIndicator(),
      ));
    }
    else if (_isError) {
      return Center(child: Text("Ha habido un error"));
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _homePresenter.fetchData();
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.question_answer),
              title:
                  Text(data[position].question),
              onTap: () {
                _homePresenter.elementClicked(position);
              },
            );
          },
          itemCount: data.length,
          reverse: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }
}
