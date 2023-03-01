import 'dart:developer';

import 'package:firstapplication/modules/counter_app/counter/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class counter_screen  extends StatelessWidget {


  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child:BlocConsumer<CounterCubit,CounterStates>(
          builder:(context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'counter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

              ),

              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Container(

                      color: Colors.grey,

                      child: TextButton(onPressed: (){
                        CounterCubit.get(context).minus();
                        print('${CounterCubit.get(context).counter}');

                      }, child: Text(

                        'Munis',
                        style: TextStyle(

                            color: Colors.white
                        ),
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '${CounterCubit.get(context).counter}',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Container(

                      color: Colors.grey,
                      child: TextButton(onPressed: (){
                        CounterCubit.get(context).plus();
                        print('${CounterCubit.get(context).counter}');

                      }, child: Text(

                        'Plus',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),),
                    ),



                  ],

                ),
              ),

            );
          } ,
      listener:(context, state) {}  ,

      ),
    );
  }


}



