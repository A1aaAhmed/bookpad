import 'package:flutter/material.dart';

Widget button ({
     required String text,
     required VoidCallback onPress,
     double width =double.infinity,
     double height =60,
     Color colorBackground = Colors.blue,
     double  r= 10,
})=> Container(
      width:  width,
      height: height,
  decoration: BoxDecoration(
    color: colorBackground,
    borderRadius: BorderRadius.circular(r),
  ),
  child: MaterialButton(
    onPressed:onPress,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 20,
      )
    ),
  ),
);
Widget defaultForm ({
  required TextEditingController controller,
  required TextInputType inputType,
  Function? onSubmit,
  required String validator,
  required String label,
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
        onSubmit!(s);
      },
      //function that i can do work on it

// ignore: prefer_const_constructors
      decoration: InputDecoration(
        //hintText: 'abc@examble.com',
  labelText: label,
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



