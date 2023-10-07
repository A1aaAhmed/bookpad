

import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../styles/colors.dart';
import '../homescreen/homepage.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("BookPad"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children:  [
              const Text(
                    'Login',
                     style:TextStyle(
                         color: ColorTheme.babyBlue,
                         fontSize: 80,
                         fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 60,
              ),
              button(
                width:150,
                height:80,
                text: 'Login with Google',
                onPress: (){
/*                    if (){
                  Navigator.push(context, MaterialPageRoute(builder:(contex)=>HomePage()));
                  }
                  else {

                  }*/
                }

                ),
            ]
          ),
        ),
      ),
    );
  }
}
