import 'package:examen_flutter/model/data.dart';

abstract class HomeView {
  openSettingsScreen(int position);

  showUsers(List<Data> users);

  showLoading();

  hideLoading();

  showError();
}