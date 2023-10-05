import 'package:flutter/material.dart';
import 'package:tryyy/modules/login/login.dart';

void main() {
  runApp(const MyApp());//the function wich runs the app
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


    //matrial app is a home to all the screen in an app
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
    // home need widget and also text
    //matrialapp is a built in function that is a same as myapp
  }
}