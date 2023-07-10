import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/numbers_list_provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
        builder: (context, numbersListProviderObject, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              numbersListProviderObject.add();
            },
            child: Icon(Icons.add),
          ),

          appBar: AppBar(),

          body: SizedBox(
            child: Column(
              children: [
                Text("The value of Latest added number to array : ${numbersListProviderObject.numbers.last.toString()}",style: TextStyle(fontSize: 40)),

                const Text("Below is the list of numbers and upon the click of add button 1 is added to the last item of array and updated number is added to the array to be displayed and also at the top"),

                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: SizedBox(
                    height: 200,
                    width: double.maxFinite,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: numbersListProviderObject.numbers.length,
                        itemBuilder: (context, index){
                          return Text(numbersListProviderObject.numbers[index].toString(),style: TextStyle(fontSize: 30,letterSpacing: 20),);
                        }
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
