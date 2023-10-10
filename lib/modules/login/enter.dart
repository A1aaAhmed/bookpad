import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:tryyy/modules/login/authent.dart';
import '../../shared/components/components.dart';
import '../../styles/colors.dart';

class EnterScreen extends ConsumerWidget {
  const EnterScreen({super.key});

  //const LoginScreen({Key? key}) : super(key: key);
  void signInWG(WidgetRef ref) {
    ref.watch(authProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.read(authProvider).signInWithGoogle();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar:AppBar(
      //   title: const Text("BookPad"),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 450,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/butter.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 300),
                    child: StrokeText(
                      text: "Enter",
                      textStyle: TextStyle(
                        fontSize: 100,
                        color: ColorTheme.babyBlue,
                      ),
                      strokeColor: ColorTheme.white,
                      strokeWidth: 5,
                    ),
                  ),
                ]),
          ),
          button(
            color: ColorTheme.white,
            width: 200,
            height: 60,
            text: 'Welcome Back ^ ^',
            onPress: () => signInWG(ref),
          ),
        ],
      ),
    );
  }
}
