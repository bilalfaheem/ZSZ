import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class StateLessClass extends StatelessWidget {
  const StateLessClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar(
        backgroundColor: Color.fromARGB(233, 225, 59, 59),
        leading: GestureDetector(
          onTap: (){
            print("Alarm");
          },
          child: Icon(Icons.alarm)),
        title: Text("Ammad"),
        actions: [
          GestureDetector(
            onLongPress: (){
              print("Long Press");
            },
            child: Icon(Icons.person))
        ],
      ),
      body:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.amber,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.red,
            height: 100,
            width: 100,
            child: Text("red",style: TextStyle(color: Colors.white,fontSize: 20),),
          )
        ],
      ) ,
    );
  }
}
