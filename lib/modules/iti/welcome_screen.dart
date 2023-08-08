// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          width: double.infinity,
         color: Color.fromARGB(255, 7, 95, 83),
          child:Center(
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icon(Icons.android,color: Colors.white,size: 100.0,),
                Image.network('https://www.destinationspace.uk/assets/svg/fallbacks/logo-destination-space.bd7d26581d9a.png'),
               SizedBox(height: 30.0,),
                Text(textAlign: TextAlign.center,'Track items      to destination every time',style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 30.0,),
               Text(textAlign: TextAlign.center,'Monitor the goods until the destinationز',style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 207, 197, 197)
                ),),
                SizedBox(height: 50.0,),
                
                MaterialButton(
                  color: Color.fromARGB(255, 128, 206, 168),
                  minWidth:250.0,
                  height: 50.0,
                  onPressed: (){}
                  ,child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get started',style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),),
                      Icon(Icons.arrow_right_outlined,size: 30.0,)
                    ],
                  ),
                  )
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
