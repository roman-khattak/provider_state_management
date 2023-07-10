import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/numbers_list_provider.dart';
import 'package:provider_state_management/counter_screen/second_page.dart';

class Home extends StatelessWidget {
   Home({super.key});

  @override
  Widget build(BuildContext context) {

    // the statement below is creating instance 'listProvider' to access provider class called "NumbersListProvider"
    final listProvider = Provider.of<NumbersListProvider>(context,listen: false);

    return Consumer<NumbersListProvider>(
        // 'where the <NumbersListProvider> is the name of the provider for which we have used the following 'Consumer' widget.
        // And "numbersListProviderObject" is the instance of "NumbersListProvider" through which we will access the items inside the Provider Class.
      // 'child' in 'Consumer' is the Widget that it will return
      //   //  // The sizedBox widget is Wrapped with Consumer because we have to use the properties of Provider class inside this widget also we have defined the type of consumer, i.e., for which provider the Consumer will be used.
        builder: (BuildContext context, NumbersListProvider numbersListProviderObject, Widget? child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              numbersListProviderObject.add();
            },
            child: Icon(Icons.add),
          ),

          appBar: AppBar(),

          body:  SizedBox(
            child: Column(
              children: [
                const Text("The provider package is installed in pubspec.yaml"),

                Text("The value of Latest added number to array : ${numbersListProviderObject.numbers.last.toString()}",style: TextStyle(fontSize: 40)),

                const Text("Below is the list of numbers and upon the click of add button 1 is added to the last item of array and updated number is added to the array to be displayed and also at the top"),

                Expanded(  // ListView.builder is wrapped with expanded so that the list can be accommodated and do not overflow
                  child: Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: ListView.builder(

                        itemCount: numbersListProviderObject.numbers.length,

                        itemBuilder: (context, index){
                          return Text(
                            numbersListProviderObject.numbers[index].toString(),

                            style: TextStyle(fontSize: 30),);
                        }
                    ),
                  ),
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const SecondPage();
                      },));
                    },
                    child: Text("Go to Second Page")),
              ],
            ),
          ),
        ),
    );
  }
}
