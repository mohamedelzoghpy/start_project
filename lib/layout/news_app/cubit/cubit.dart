// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:firstapplication/layout/news_app/cubit/states.dart';
import 'package:firstapplication/modules/news_app/business/business_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../modules/news_app/science/science_screen.dart';
import '../../../modules/news_app/sports/sports_screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=  0;
  List<BottomNavigationBarItem> bottomItems =[
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.business
        ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
          Icons.sports
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
          Icons.science
      ),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(
    //       Icons.settings
    //   ),
    //   label: 'Settings',
    // ),


  ] ;

  void ChanageBottomNavBar(int index){
    currentIndex=index;
    emit(NewsBottomNavState());

  }

  List<Widget>screens=[
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),


  ];
  List<dynamic> business = [];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apikey':'62e209077faa4cc88100d9e4e744a6ac',
      },
    ).then((value) {
     // print(value.data['totalResults']);
      business=value.data['articles'];
      print(business[14]['title']);
      emit(NewsGetBusinessSuccessState());


    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'sports',
        'apikey':'62e209077faa4cc88100d9e4e744a6ac',
      },
    ).then((value) {
      // print(value.data['totalResults']);
      sports=value.data['articles'];
      print(sports[14]['title']);
      emit(NewsGetSportsSuccessState());


    }).catchError((error){
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }
  List<dynamic> science = [];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'science',
        'apikey':'62e209077faa4cc88100d9e4e744a6ac',
      },
    ).then((value) {
      // print(value.data['totalResults']);
      science=value.data['articles'];
      print(science[14]['title']);
      emit(NewsGetScienceSuccessState());


    }).catchError((error){
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }
  List<dynamic> search = [];
  void getSearch(String? value){
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apikey':'62e209077faa4cc88100d9e4e744a6ac',
      },
    ).then((value) {
      // print(value.data['totalResults']);
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());


    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

}