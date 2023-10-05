

import 'package:flutter/material.dart';
import 'package:tryyy/modules/homescreen/homepage.dart';
import 'package:tryyy/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailCont=TextEditingController();
  final formkey=GlobalKey<FormState>();// any widget can has a key a uniqe id for a widget
  //GlobalKey<FormState>formkey = GlobalKey();
  var passwordcont=TextEditingController();
  bool notShowPass= true;
  Color textColor = Colors.white;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key:formkey,
              child: Column(
                children:  [
                  const Text(
                        'Login',

                         style:TextStyle(
                             color: Colors.blueAccent,
                             fontSize: 80,
                             fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  defualtForm(
                    controller: emailCont,
                    lable: 'Email Address',
                    prefix: Icons.email,
                    inputType: TextInputType.emailAddress,
                    validator: 'email address can\'t be empty',
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  defualtForm(
                      controller: passwordcont,
                      lable: 'Password',
                    hidden: notShowPass,
                    sufffun: () {
                      setState(() {
                        notShowPass = !notShowPass;
                      });
                    },
                    prefix: Icons.password,
                    inputType: TextInputType.visiblePassword,
                    postfix:
                        notShowPass ? Icons.visibility_off : Icons.visibility,
                    validator: 'please enter your password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',

                      style: TextStyle(
                        fontSize: 15,
                      ),
                      ),
                      TextButton(
                          onPressed: (){

                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 15,
                            ),
                          ),
                      ),
                    ],
                  ),
                  loginBoutton(
                    email: emailCont,
                    password: passwordcont,
                    text: 'Login',
                    onpress: (){
                      if ((formkey.currentState!.validate())){
                        //checks and if okay do it else print
                      //  the ! means even if there is null value iam sure is safe  in null safty
                      print(emailCont.text);
                      print(passwordcont.text);
                      setState(() {
                      if (emailCont.text=='abc@gmail.com' && passwordcont.text=='aaa'){
                      Navigator.push(context, MaterialPageRoute(builder:(contex)=>HomePage()));
                      }
                      else {
                        textColor= Colors.red;
                      }
                      });
                    }
                    }

                    ),


                  Text(
                    'Wrong Email or Password',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
