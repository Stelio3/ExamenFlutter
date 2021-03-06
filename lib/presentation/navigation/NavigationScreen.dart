import 'package:flutter/material.dart';
import 'package:examen_flutter/presentation/homescreen/HomeScreen.dart';
import 'package:examen_flutter/presentation/settings/SettingsScreen.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  HomeScreen _homeScreen = HomeScreen();
  SettingsScreen _settingsScreen = SettingsScreen(1);
  int _currentScreenIndex = 0;

  _getCurrentScreen() {
    switch (_currentScreenIndex) {
      case 0:
        return _homeScreen;
      case 1:
        return _settingsScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getCurrentScreen(),
    );
  }
}
