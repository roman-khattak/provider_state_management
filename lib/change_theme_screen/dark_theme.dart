import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {

    final themeChanger = Provider.of<ThemeChangerProvider>(context);  //This works the same as context.watch<ModelProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Changer Provider"),
      ),
      body: Column(
        children: [

       //    'ThemeMode' has three types/states: System, Light and Dark'
          RadioListTile<ThemeMode>(  // we assigned 'ThemeMode' to the 'RadioListTile' which will tell it what is the current mode of system UI
              title: Text("Light Mode"),
              value: ThemeMode.light,  // this "value" is coming from the <ThemeMode> defined with 'RadioListTile'
              groupValue: themeChanger.themeModeGetter,
              onChanged: themeChanger.setTheme // to "setTheme" we are not passing directly the 'ThemeMode.light' parameter because we have already passed it to value and that is passed to 'setTheme' from with-in.
          ),

          RadioListTile<ThemeMode>(  // we assigned 'ThemeMode' to the 'RadioListTile' which will tell it what is the current mode of system UI
              title: Text("Dark Mode"),
              // 'value': Specifies the value that corresponds to the "Dark Mode" option. In this case, it's ThemeMode.dark.
              value: ThemeMode.dark,  // this "value" is coming from the <ThemeMode> defined with 'RadioListTile'
              //'groupValue': Represents the current value of the group of radio buttons. In this case, it's the current theme mode obtained from themeChanger.themeModeGetter. This ensures that the radio button representing the current theme mode is selected.
              groupValue: themeChanger.themeModeGetter,
              // 'onChanged': This callback function is triggered when the user selects a different theme mode option. It calls the setTheme method of the themeChanger instance, which is an instance of the ThemeChangerProvider class. The setTheme method is responsible for updating the theme mode and notifying listeners about the change.
              onChanged: themeChanger.setTheme // to "setTheme" we are not passing directly the 'ThemeMode.light' parameter because we have already passed it to value and that is passed to 'setTheme' from with-in.
          ),

          RadioListTile<ThemeMode>(  // we assigned 'ThemeMode' to the 'RadioListTile' which will tell it what is the current mode of system UI
              title: Text("System Mode"),
              value: ThemeMode.system,  // this "value" is coming from the <ThemeMode> defined with 'RadioListTile'
              groupValue: themeChanger.themeModeGetter,
              onChanged: themeChanger.setTheme // to "setTheme" we are not passing directly the 'ThemeMode.light' parameter because we have already passed it to value and that is passed to 'setTheme' from with-in.
          ),

          SizedBox(height: 30),

          Icon(Icons.favorite, size: 40,),

        ],
      ),
    );
  }
}
