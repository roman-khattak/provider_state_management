import 'dart:math';

import 'package:flutter/cupertino.dart';   // This package is imported to use 'ChangeNotifier' class as a mixin

import '../models/movie_model.dart';

// "final List<Movie> initialData": This line declares a variable named initialData as a final list of Movie objects. The final keyword means that the variable cannot be reassigned once it has been initialized.
//
// "List.generate": This method is used to create a new list based on a given length and a function that generates each element of the list.
//
// "21": The first argument passed to the List.generate method is the length of the list. In this case, the list will have 21 elements.
//
// "(index) => Movie(...)": This is the generator function that will be called for each index in the range of 0 to 20 (inclusive). It takes the current index as a parameter and returns a Movie object.
//
// "Movie(...)": This is the constructor call for the Movie class, which creates a new Movie object.
//
// "title: "Movie $index"": This sets the title property of the Movie object to a string value. The index variable is interpolated into the string to create a unique title for each movie based on its index in the list.
//
// duration: "${Random().nextInt(100) + 60} minutes" :
// .............................................................
//  Random().nextInt(100): The Random() constructor creates a new instance of the Random class, which provides functionality to generate random numbers. The method nextInt(100) is called on this instance, which generates a random integer between 0 and 99 (inclusive). The argument 100 specifies the upper bound for the random number generation.
//
// + 60: The generated random number is then added to 60. This is done to ensure that the generated duration is at least 60 minutes. The nextInt(100) generates values between 0 and 99, so adding 60 to it shifts the range to 60-159.
//
// "${...} minutes": The resulting duration (random number + 60) is interpolated into a string by enclosing it in ${...}. This is done using string interpolation, a feature in Dart that allows you to embed expressions within string literals. The resulting value is then concatenated with the string " minutes" to create the final duration string representation.
//
// For example, let's say the randomly generated number is 75. Adding 60 to it gives us 135. So the resulting string would be "135 minutes".
//
// In summary, the code generates a random number between 60 and 159 and uses string interpolation to construct a string representation of the duration by appending the string " minutes". This value is then assigned to the duration property of the Movie object.


// we are creating 20 objects by the name of "Movie" based on the 'movie_model' class and storing them in the 'initialData' list
final List<Movie> initialData = List.generate(  // The final keyword means that the variable cannot be reassigned once it has been initialized.
    21,  // length of list
    (index) => Movie(
        title: "Movie $index",
        duration: "${Random().nextInt(100) + 60} minutes"
    )
);

class AddToCartProvider with ChangeNotifier {

    // storing the list of Movie objects called 'initialData' in private variable '_movies' and then we access '_movies' through getter function called 'moviesList'
    final List<Movie> _movies = initialData;
    List<Movie> get moviesList => _movies;

    // creating this empty list called "_myCartList" below to store and display the items added to cart as favourite
    final List<Movie> _myCartList = [];
    List<Movie> get myCartList => _myCartList;

    void addToList(Movie movie) { // This function expects an object of type 'Movie' so as to add it to "_myCartList"
        _myCartList.add(movie);

        notifyListeners();  // this 'notifyListeners()' method will inform state about a movie object if added or removed from the cartList
    }

    void removeFromList(Movie movie) { // through this function we remove the specific/clicked object from the '_myCartList'
        _myCartList.remove(movie);

        notifyListeners();
    }
}