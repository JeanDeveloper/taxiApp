import 'package:flutter/widgets.dart';

class LoginProvider extends ChangeNotifier{

  int _stepSelected = 0;

  int get stepSelected => _stepSelected;

  set stepSelected(int valor){
    _stepSelected = valor;
    notifyListeners();
  }

}