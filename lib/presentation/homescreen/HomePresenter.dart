import 'dart:convert';

import 'package:examen_flutter/model/data.dart';
import 'package:examen_flutter/presentation/homescreen/HomeView.dart';
import 'package:http/http.dart' as network;

class HomePresenter {
  HomeView _view;

  HomePresenter(this._view);

  fetchData() async {
    _view.showLoading();
    network.Response response =
    await network.get('https://opentdb.com/api.php?amount=10');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      List<Data> users = jsonBody['results'].map<Data>((element) {
        String question = element['question'];
        String correct_answer = element['correct_answer'];
        List<String> incorrect_answers = new List<String>();
        print("Pregunta: " + question);
        print("Correctos: " + correct_answer);
        List tamano =  element['incorrect_answers'];
        for(int i = 0; i < tamano.length; i++) {
          print("Incorrectos: " + element['incorrect_answers'][i]);
            incorrect_answers.add(element['incorrect_answers'][i]);
        }
          return Data(question, correct_answer, incorrect_answers);
      }).toList();
      _view.showUsers(users);
    } else {
      _view.showError();
    }
    _view.hideLoading();
  }

  elementClicked(int position) {
    _view.openSettingsScreen(position);
  }
}
