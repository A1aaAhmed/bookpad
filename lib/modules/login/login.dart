import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:tryyy/modules/login/authent.dart';
import '../../shared/components/components.dart';
import '../../styles/colors.dart';
import '../homescreen/homepage.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  //const LoginScreen({Key? key}) : super(key: key);
  void signInWG(WidgetRef ref, BuildContext context) async {
    final smessg = ScaffoldMessenger.of(context);
    final nav = Navigator.of(context);
    final errorModel = await ref.read(authProvider).signInWithGoogle();
    if (errorModel.error == null) {
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      nav.push(MaterialPageRoute(
          builder: (
        context,
      ) =>
              HomePage()));
    } else {
      print("qqqqqqqqqqqqqqqqqqwwwww");
      smessg.showSnackBar(SnackBar(content: Text(errorModel.error!)));
    }
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 460,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/book.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: StrokeText(
                      text: "Login",
                      textStyle: TextStyle(
                        fontSize: 210,
                        color: ColorTheme.babyBlue,
                      ),
                      strokeColor: ColorTheme.white,
                      strokeWidth: 5,
                    ),
                  ),
                ]),
          ),
          button(
            bo: 10,
            color: ColorTheme.white,
            width: 200,
            height: 60,
            text: 'Login with Google',
            onPress: () => signInWG(ref, context),
          ),
        ],
      ),
    );
  }
}
