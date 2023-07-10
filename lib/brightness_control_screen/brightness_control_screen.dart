import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/brightness_control_provider.dart';

class BrightnessControlScreen extends StatefulWidget {
  const BrightnessControlScreen({super.key});

  @override
  State<BrightnessControlScreen> createState() => _BrightnessControlScreenState();
}

class _BrightnessControlScreenState extends State<BrightnessControlScreen> {

  // Note:
 /// Provider.of<>() can access the data that's inside ProviderClass( this class extends ChangeNotifier). It's job is to read the data from ProviderClass.
// eg; Provider.of<ProviderClass>(context, listen:false).incrementX();

  @override
  Widget build(BuildContext context) {
    // the statement below is creating instance 'brightProvider' to access provider class called "BrightnessControlProvider"
    // "final brightProvider = Provider.of<BrightnessControlProvider>(context);" makes the widget listen for changes in the 'BrightnessControlProvider'.

    //  final brightProvider = Provider.of<BrightnessControlProvider>(context);  // when using Consumer there is no need for this because the following instance is created there by default

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brightness Control Screen'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Consumer<BrightnessControlProvider>(builder: (context, brightProviderObj, child) {
            return Slider(
                min: 0,
                max: 1,
                value: brightProviderObj.gettingValue,  // assigning initial value of slider from the provider class
                onChanged: (val) {  // when slider is changed so 'onChanged' is called and it takes up the new value store it in 'val' and then pass it on to 'double value' variable to update it and change opacity of the containers below.
                  brightProviderObj.setValue(val);  // passing the value of "val" which is the updated/changed value of slider to "set()" function in the provider
                });
          },),
          
         Consumer<BrightnessControlProvider>(builder: (context, brightProviderObj, child) {
           return  Row(
             children: [
               Expanded(
                 child: Container(
                   height: 100,
                   decoration: BoxDecoration(
                     // The Opacity value of the following container will change as the slider changes the value of "double value" variable
                       color: Colors.green.withOpacity(brightProviderObj.gettingValue)
                   ),
                   child: Center(
                     child: Text("Container 1"),
                   ),
                 ),
               ),
               Expanded(
                 child: Container(
                   height: 100,
                   decoration: BoxDecoration(
                     // The Opacity value of the following container will change as the slider changes the value of "double value" variable
                       color: Colors.blue.withOpacity(brightProviderObj.gettingValue)
                   ),
                   child: Center(
                     child: Text("Container 2"),
                   ),
                 ),
               ),
             ],
           );
         },),

        ],
      ),
    );
  }
}
