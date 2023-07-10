import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';  // this library is imported to use 'ChangeNotifier' class as a mixin

class ThemeChangerProvider with ChangeNotifier {  // This line declares the class ThemeChangerProvider and indicates that it uses the ChangeNotifier mixin. Using with allows the class to inherit the behavior of ChangeNotifier, which provides the necessary functionality to notify listeners when the state changes.

  // The get keyword indicates that this is a getter method, and it allows you to access the value of _themeMode as if it were a property.
  // This getter method returns the value of the private variable _themeMode, allowing external code to read the current theme mode.

  var _themeMode = ThemeMode.light;   // defining the initial mode of theme as light mode
   ThemeMode get themeModeGetter => _themeMode;  //creating a get method of type ThemeMode to get the value of private variable "_themeMode"

  void setTheme(themeModeGetter) {   //  //void setTheme(themeModeGetter) { ... }: This is a method named 'setTheme' is a "setter method" that takes a parameter 'themeModeGetter'. The purpose of this method is to update the '_themeMode' variable with a 'new value'.
    _themeMode = themeModeGetter;  //This line assigns the value returned from the 'themeModeGetter' parameter to the '_themeMode' variable, effectively updating the theme mode to the 'new value'.

    notifyListeners();
    //This method is called to notify any registered listeners that the state has changed. It is commonly used in Flutter applications with the ChangeNotifier class to trigger updates in the user interface when the underlying data changes.
  }
}