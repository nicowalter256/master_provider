import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int number = 0;
  void increaseNumber() {
    number++;
    notifyListeners();
  }

  void reduceNumber() {
    number--;
    notifyListeners();
  }
}
