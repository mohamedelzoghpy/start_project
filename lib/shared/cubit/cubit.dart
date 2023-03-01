// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:firstapplication/shared/cubit/states.dart';
import 'package:firstapplication/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../modules/todo_app/archive_tasks/archivetasks.dart';
import '../../modules/todo_app/done_tasks/donetasks.dart';
import '../../modules/todo_app/new_tasks/newtasks.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  int current=0;
  List<Widget>screens=[
    NewTasksScreen(),
    NewDoneTasksScreen(),
    NewAchriveScreen(),


  ];
  List<String>titles=[
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',

  ];


  Future<void> ChangeAPPIndex(int index) async {
   current=index;
    emit(AppChangeBottomNavBarState());

// print('$current');

  }

  Database? database ;
  //List<Map> Taks =[NewTasks[],DoneTasks,ArchiveTasks];
  List<Map> NewTasks =[];
  List<Map> DoneTasks =[];
  List<Map> ArchiveTasks =[];



  void createDatabase() {

     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database,version){
        print('database created');
        database.execute('CREATE TABLE Tasks (id INTEGER PRIMARY KEY, date TEXT, title TEXT, status TEXT, time TEXT   ) ').then((value) {
          print('table created');
        }).catchError((error){
          print('Error is ${error.toString()}');
        });



      },
      onOpen: (database){
        SelectFromDatabase(database);
        print('database opened');
        }
     ).then((value) {

     database=value;
     emit(AppCreateDatabaseState());

    });

  }

   InsertIntoDatabase({
    @required title ,
    @required time ,
    @required date
  })async {
    await database?.transaction((txn)
    async {
      txn.rawInsert(
          'INSERT INTO tasks (title,date,status,time) VALUES("$title","$date","New","$time")'
      ).then((value) {
        print('$value Record successfully inserted');
        emit(AppInsertIntoDatabaseState());
        SelectFromDatabase(database);
      }).catchError((error) {
        print('error is ${error.toString()}');
      });
    }
    );
  }

   void SelectFromDatabase(database)  {
    NewTasks=[];
    DoneTasks=[];
    ArchiveTasks=[];

    emit(AppLoadingState());
    database.rawQuery(
        'SELECT * FROM tasks'
    ).then((value) {
      emit(AppGetFromDatabaseState());
      value.forEach((element) {
        if(element['status']=='New') {
          NewTasks.add(element);
        } else if(element['status']=='done') {
          DoneTasks.add(element);
        } else if(element['status']=='Archive') {
          ArchiveTasks.add(element);
        }


      });

    });
  //   print(NewTasks);
  //   print(ArchiveTasks);
  //   print(DoneTasks);
   }

  void UpdateData ({
    required String status,
    required int id,
  }
      ) async {
    database?.rawUpdate(
      'UPDATE tasks SET status = ?   WHERE id = ?',
      [status , id ,],
    ).then((value) {
      SelectFromDatabase(database);
      emit(AppUpdateDatabaseState());
        print('UPDATED SUCCESSFULLY');
      });
  }
  void DeleteDatabase ({
    required int id,
  }
      ) async {
    database?.rawDelete(
        'DELETE FROM tasks  WHERE id = ?',
        [ id,]
    ).then((value) {
      SelectFromDatabase(database);
      emit(AppDeleteDatabaseState());
      print('Delete SUCCESSFULLY');
    });
  }
    bool bottomsheetisshown=false;
  IconData fabicon=Icons.edit;
  void bottomsheetState({
  required bool  isShow,
  required IconData icon,
  }){
    bottomsheetisshown=isShow;
    fabicon=icon;
    emit(AppChangeBottomSheetState());

  }
bool isDark = false;
  void changeAppMode({bool? fromCache}){
    if(fromCache==null){
      isDark=!isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChanageAppModeState());
      });
    }else {
      isDark=fromCache;
      emit(ChanageAppModeState());

    }

  }
}






