import 'package:flutter/material.dart';

class BmiResult_screen  extends StatelessWidget {

  final double result;
  final int age ;
  final bool isMale;

  BmiResult_screen({

   required this.isMale,
   required this.age,
    required this.result,


});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(

    title: Text(

   'BMI RESULT',

),
    ),

      body: Container(
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(

                'GENDER : ${isMale? 'Male' : 'Female'} ',
                style: TextStyle(

                  fontSize: 40,
                ),
              ),
              Text(

                'AGE : $age',
                style: TextStyle(

                  fontSize: 40,
                ),
              ),
              Text(

                'RESULT : ${result.round()}',
                style: TextStyle(

                  fontSize: 40,
                ),
              ),



            ],
          ),
        ),

      ),

    );
  }
}
