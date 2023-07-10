
import 'package:flutter/cupertino.dart';

// using the concept of inheritance we are inheriting/extending a custom child class / Provider Class called "NumbersListProvider" from built-in class of provider package "ChangeNotifier"
// 'ChangeNotifier' will notify us about the changes happening in the state of a variable/list

// 'NumbersListProvider' is called a provider class

class NumbersListProvider extends ChangeNotifier {    // "ChangeNotifier" works as SetState.

  List<int> numbers = [1,2,3,4];

  void add () {
    // adding '1' to the last element of the list and then adding new number into the same list as well
    int last = numbers.last;
    numbers.add(last + 1);

    notifyListeners();  // whenever a change occurs to the variables or list in the provider class, or when the function is called then these 'notifyListeners()' will notify the respective 'Consumer' widgets about the changes and hence the 'Consumers' will implement the changes.
  }

}