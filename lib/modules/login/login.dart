

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:tryyy/modules/login/authent.dart';
import '../../shared/components/components.dart';
import '../../styles/colors.dart';



class LoginScreen extends ConsumerWidget {
  //const LoginScreen({Key? key}) : super(key: key);
  void signInWG(WidgetRef ref){
    ref.watch(authProvider).signInWithGoogle();
  }
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // ref.read(authProvider).signInWithGoogle();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar:AppBar(
      //   title: const Text("BookPad"),
      // ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 500,
            decoration:  const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/book.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  const [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: StrokeText(
                    text: "Login",
                    textStyle: TextStyle(
                        fontSize: 210,
                        color: ColorTheme.babyBlue,
                    ),
                    strokeColor:  ColorTheme.white,
                    strokeWidth: 5,
                  ),
                ),
              ]
            ),
          ),
          button(
            color: ColorTheme.white,
            width:200,
            height:60,
            text: 'Login with Google',
            onPress: () => signInWG(ref),

          ),
        ],
      ),
    );
  }
}
