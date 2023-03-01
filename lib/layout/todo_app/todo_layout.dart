import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstapplication/modules/todo_app/new_tasks/newtasks.dart';
import 'package:firstapplication/shared/components/components.dart';
import 'package:firstapplication/shared/cubit/cubit.dart';
import 'package:firstapplication/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../shared/components/constants.dart';

class HomeLayout  extends StatelessWidget {

  var scaffold_key=GlobalKey<ScaffoldState>();
  var titleController=TextEditingController();
  var timeController=TextEditingController();
  var dateController=TextEditingController();
  var formkey=GlobalKey<FormState>();
  // List<Map> tasks =[];
  @override
  Widget build(BuildContext context) {
  return BlocProvider(
    create: (BuildContext context)=>AppCubit()..createDatabase(),
    child: BlocConsumer<AppCubit,AppStates>(

      builder: (BuildContext context, AppStates state) {
        AppCubit cubit=BlocProvider.of(context);
        return Scaffold(
          key: scaffold_key,
          appBar: AppBar(

            title: Text(
              cubit.titles[cubit.current],
              style: TextStyle(
                fontSize: 20,
              ),

            ),
          ),
          body: ConditionalBuilder(
            builder:(context)=>cubit.screens[cubit.current],
            condition:state is! AppLoadingState,
            fallback:(context) => Center(child: CircularProgressIndicator()) ,
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex:cubit.current ,
              type: BottomNavigationBarType.fixed,

              onTap: (index){
                cubit.ChangeAPPIndex(index);
                },

              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.task) ,
                  label: 'Taks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check) ,
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined) ,
                  label: 'Archive',
                ),





              ]
          ),
          floatingActionButton:FloatingActionButton(

            child: Icon(cubit.fabicon),

            onPressed: () {
              if(cubit.bottomsheetisshown) {
                if(formkey.currentState!.validate()){
                  cubit.InsertIntoDatabase(title: titleController.text, time: timeController.text, date: dateController.text);
                }

              }
              else{

                scaffold_key.currentState?.showBottomSheet(
                      (context) =>
                      Container(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultformfiled(controller: titleController,
                                  type: TextInputType.text,
                                  validate: (value){
                                    if(value!.isEmpty){

                                      return('title must not Empty');
                                    }

                                    return null;
                                  },
                                  label:'Task Title' ,
                                  prefix: Icons.title,

                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                defaultformfiled(controller: timeController,
                                  type: TextInputType.datetime,
                                  ontap: (){
                                    showTimePicker(context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value){
                                      var time =value!.format(context);
                                      timeController.text = time;


                                    });
                                  },
                                  validate: (value){
                                    if(value!.isEmpty){

                                      return('time must not Empty');
                                    }

                                    return null;
                                  },
                                  label:'Task Time' ,
                                  prefix: Icons.watch_later_outlined,

                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                defaultformfiled(controller: dateController,
                                  type: TextInputType.datetime,
                                  ontap: (){
                                    showDatePicker(context: context,
                                      initialDate:DateTime.now() ,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-11-20'),
                                    ).then((value){
                                      var date = DateFormat.yMMMd().format(value!);
                                      dateController.text = date;


                                    });
                                  },
                                  validate: (value){
                                    if(value!.isEmpty){

                                      return('Date must not Empty');
                                    }

                                    return null;
                                  },
                                  label:'Task Date' ,
                                  prefix: Icons.date_range_outlined,

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                ).closed.then((value) {

                  cubit.bottomsheetState(isShow: false, icon: Icons.edit);
                 // print('edit');
                });


                cubit.bottomsheetState(isShow: true, icon: Icons.add);
                
                //print('add');

              }




            },
          ),




        );

      } ,

      listener: (BuildContext context, AppStates state) {
//if(state is AppChangeBottomNavBarState) print('app change');
if(state is AppInsertIntoDatabaseState){
    Navigator.pop(context);

}


} ,
    ),
  );
  }

  Future<String> getname
  () async {
  return 'mohamed zoghlol';


  }


  }




