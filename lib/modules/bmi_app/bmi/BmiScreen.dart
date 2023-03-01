import 'dart:math';

import '../bmi_result/BMIResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi_Calculator extends StatefulWidget {
  @override
  _Bmi_CalculatorState createState() => _Bmi_CalculatorState();
}

class _Bmi_CalculatorState extends State<Bmi_Calculator> {

  bool isMale=true;
  double height=120;
  int weight=30;
  int age=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20,),
          child: Text(

            'BMI Calculator'
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: [

            Expanded(
              child:

                 Row(


                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap:(){

                          setState(() {
                            isMale=true;

                          });
                        } ,
                        child: Container(

                          color: isMale ? Colors.blue : Colors.grey[500],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Icon(
                                  Icons.male,
                                size:90,
                                color: Colors.white,

                              ),
                              SizedBox(
                                height:20,
                              ),

                              Text('MALE',
                              style: TextStyle(
                                color: Colors.white,

                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(


                        onTap: (){

                          setState(() {
                            isMale=false;

                          });
                        },
                        child: Container(
                          color:isMale ?   Colors.grey[500] :Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Icon(
                                Icons.female,
                                size:90,
                                color: Colors.white,

                              ),
                              SizedBox(
                                height:20,
                              ),

                              Text('FEMALE',
                                style: TextStyle(
                                  color:Colors.white,

                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child:

              Column(


                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,

                      color: Colors.grey[500],
                      child: Column(

                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:10, ),
                            child: Text('HEIGHT',
                              style: TextStyle(
                                color: Colors.white,

                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('${height.round()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                              Text('cm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),

                            ],
                          ),


                          SizedBox(
                            height:10,
                          ),
                          
                          Slider(
                              value:height,
                              max: 220,
                              min: 80,
                              onChanged: (value){

                            setState(() {

                          height= value;
                            });
                              })

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),

            ),
//            SizedBox(
//              height: 20,
//            ),
            Expanded(
              child:

              Row(


                children: [
                  Expanded(
                    child: Container(

                      color: Colors.grey[500],
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('WEIGHT',
                            style: TextStyle(
                              color: Colors.white,

                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height:10,
                          ),
                          Text('$weight',
                            style: TextStyle(
                              color: Colors.white,

                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(onPressed: (){

                                    setState(() {

                                      weight--;
                                    });
                                  },

                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                    heroTag:'weight-' ,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(onPressed: (){

                                    setState(() {

                                      weight++;
                                    });
                                  },

                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    heroTag:'weight+' ,

                                  ),



                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(

                      color: Colors.grey[500],
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text('AGE',
                            style: TextStyle(
                              color: Colors.white,

                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height:10,
                          ),
                          Text('$age',
                            style: TextStyle(
                              color: Colors.white,

                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(onPressed: (){

                                    setState(() {

                                      for(int i=10; i>0; i--)
                                        age=i;
                                    });
                                  },

                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    heroTag:'age-' ,

                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(onPressed: (){

                                    setState(() {
                                      age++;
                                    });

                                  },

                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),


                                  ),



                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Container(

              width: double.infinity,
              height: 40,
              color: Colors.blue,
              child: MaterialButton(onPressed: (){

                double result = weight / pow(height/100,2);
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context)=>BmiResult_screen(
                          age: age,
                          result:result,
                          isMale: isMale,
                        ),

                    ),

                );
              },
              child: Text(
                'CALCULATE',

                style: TextStyle(
                  fontSize: 25,

                  color: Colors.white,
                ),

              ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}

