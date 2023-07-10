
//The foundation.dart file contains foundational classes and utilities that are commonly used in Flutter apps.

// 'class BrightnessControlProvider with ChangeNotifier { }': This line declares a class named 'BrightnessControlProvider'. The 'with' keyword is used in Dart to specify a 'mixin'. In this case, 'ChangeNotifier' is a mixin class from the 'foundation.dart' file.
// ... 'Mixins' allow classes to inherit behavior from multiple sources. By using "with ChangeNotifier", the 'BrightnessControlProvider' class can inherit the methods and properties defined in the 'ChangeNotifier' mixin class, which is essential for implementing a provider in Flutter.


import 'package:flutter/foundation.dart';

class BrightnessControlProvider with ChangeNotifier {

  double _value = 1.0;

  double get gettingValue => _value; // creating getter method to get the value of 'double value' variable

  void setValue(double val) {   // when this function is called the "double val" coming from 'onChanged' function in the 'BrightnessControlScreen' will be passed here as parameter and set to the 'value' variable and then we will get it through 'gettingValue' getter function, i.e., the value will be updated
    _value = val;

    notifyListeners();
  }

}