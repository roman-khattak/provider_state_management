
import 'package:flutter/material.dart';
import 'package:provider_state_management/counter_screen/home.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/add_to_cart_provider.dart';
import 'package:provider_state_management/provider/brightness_control_provider.dart';
import 'package:provider_state_management/provider/numbers_list_provider.dart';
import 'package:provider_state_management/provider/theme_changer_provider.dart';

import 'add_to_cart_screen/all_movies_list_screen.dart';
import 'brightness_control_screen/brightness_control_screen.dart';
import 'change_theme_screen/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        // here you have to register every provider you have used in this project here otherwise you cannot use them
          ChangeNotifierProvider(create: (context) => NumbersListProvider(),), // I have registered this 'NumbersListProvider' here

          ChangeNotifierProvider(create: (context) => BrightnessControlProvider(),), // I have registered this "BrightnessControlProvider()"

          ChangeNotifierProvider(create: (context) => AddToCartProvider()),  // This provider is registered for Add to Cart Functionality

        ChangeNotifierProvider(create: (context) => ThemeChangerProvider(),)
      ],
      child: Builder(builder: (BuildContext context) {  // using Builder method with the ThemeChangeProvider so that we can create a 'final' instance 'themeChanger' to be used in "themeMode" in "MaterialApp" widget

        final themeChanger = Provider.of<ThemeChangerProvider>(context);

        return MaterialApp(
          title: 'Provider State Management',

          themeMode: themeChanger.themeModeGetter,   // This 'themeMode' is related to 'ThemeChangerProvider'
          darkTheme: ThemeData(
            brightness: Brightness.dark,  //  for Theme Changing from light to dark through 'RadioListTile' and 'ThemeMode' here the brightness shall be set to dark in "" darkTheme's ThemeData""
            primarySwatch: Colors.yellow,
            primaryColor: Colors.pink,
            iconTheme: IconThemeData(color: Colors.pink) ,  // this will be the color of icons in dark mode
            appBarTheme: AppBarTheme(backgroundColor: Colors.teal)  // this will be the color of AppBar in dark Mode

          ),

          theme: ThemeData(

            brightness: Brightness.light,  // here we have set the brightness and ThemeData for the 'System/Light' Mode
            primarySwatch: Colors.red,
            iconTheme: IconThemeData(color: Colors.green), // this will be the color of icons in light/system mode
              appBarTheme: AppBarTheme(backgroundColor: Colors.deepPurple), //  this will be the color of AppBar in light/system Mode

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const _OptionsScreen(),
        );
      },),
    );
  }
}

class _OptionsScreen extends StatefulWidget {
  const _OptionsScreen({super.key});

  @override
  State<_OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<_OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Home();
                  },));
                },
                child: Text("Counter Screen"),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const BrightnessControlScreen();
                  },));
                },
                child: Text("Brightness Control Screen Screen"),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AllMoviesListScreen();
                  },));
                },
                child: Text("Add to Cart as Favourites"),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DarkThemeScreen();
                },));
              },
              child: Text("Change Theme"),
            ),


          ],
        ),
      ),
    );
  }
}
