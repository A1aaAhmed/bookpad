import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'modules/login/enter.dart';
import 'styles/colors.dart';




void main() {
  runApp(const ProviderScope(child:  MyApp()));//the function which runs the app
  //click ctl + B to open definition
  //myapp is widget and class myapp
  // any thing on the screen considered a widget
}


class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  // when myapp is called the two functions automatically  that be called by order are
  // constructor
  // build ------> which considered a manger for the screen myapp


  @override
  Widget build(BuildContext context) {
    // should return the first screen on the app
    // the design


    //material app is a home to all the screen in an app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:'Segoe Print',
        appBarTheme:const AppBarTheme(
          backgroundColor: ColorTheme.babyBlue,

          titleTextStyle: TextStyle(
              fontSize: 30,
              color: ColorTheme.white,
              fontWeight: FontWeight.bold
          )

        ),

      ),
      home:  EnterScreen(),
    );
    // home need widget and also text
    //matriarchal is a built in function that is a same as myapp
  }
}