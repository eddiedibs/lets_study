import 'package:flutter/foundation.dart';

class QuizProvider extends ChangeNotifier {
  int _selectedOption = -1;

  int get selectedOption => _selectedOption;

  void setSelectedOption(int option) {
    _selectedOption = option;
    notifyListeners();
  }
}
