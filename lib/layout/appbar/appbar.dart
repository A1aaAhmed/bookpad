import 'package:flutter/material.dart';
import 'package:tryyy/modules/homescreen/homepage.dart';
class Bar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<Bar> createState() => _BarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _BarState extends State<Bar> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        leading:IconButton(
          onPressed: (){

            print("kk");
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder:(contex)=>HomePage()));
            });

          },
          icon: const Icon(
            Icons.menu_book_rounded,
          ),),
        title: const Text(
          'My Notepad',
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          IconButton(
            onPressed: (){
              print("Serching");
              setState(() {
                HomePage.currentScreen =(HomePage.currentScreen!=2)?2:0;
              });
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: (){
              print("notification");
              setState(() {
                HomePage.currentScreen =(HomePage.currentScreen!=3)?3:0;

              });
            },
            icon:  const Icon(
              Icons.notifications_active,
            ),
          )


        ],

      ),
      //floatingActionButton:FloatingActionButton(
      //onPressed: (){

      //},
      //child: const Icon(
      //Icons.add,
      //),
      //) ,


    );
  }
}
