import 'package:flutter/material.dart';

Widget loginBoutton ({
     @required var email,
     @required var password,
     required String text,
     required VoidCallback onpress,
     double widthButton =double.infinity,
     Color colorBackground = Colors.blue,
     double  r= 10,})=> Container(
      width:  widthButton,
      height: 60,
  decoration: BoxDecoration(
    color: colorBackground,
    borderRadius: BorderRadius.circular(r),
  ),
  child: MaterialButton(
    // ignore: curly_braces_in_flow_control_structures
    onPressed:onpress,
    // ignore: curly_braces_in_flow_control_structures
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,

      )

    ),
  ),
);
Widget defualtForm ({
  required TextEditingController controller,
  required TextInputType inputType,
  Function? onsubmit,
  required String validator,
  required String lable,
  required IconData prefix,
  IconData? postfix,
  bool hidden = false,
  Function? sufffun,
})=>TextFormField(
  validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return validator;
        }

        return null;
      },
      controller: controller,
      keyboardType: inputType,
      obscureText: hidden,
      onFieldSubmitted: (s) {
        onsubmit!(s);
      },
      //function that i can do work on it

// ignore: prefer_const_constructors
      decoration: InputDecoration(
        //hintText: 'abc@examble.com',
  labelText: lable,
border: const OutlineInputBorder(),
prefixIcon:Icon( prefix,),
suffixIcon: IconButton(
    onPressed: (){
      sufffun!();
    },

      icon: Icon(
          postfix,
      ),
),

),
);



