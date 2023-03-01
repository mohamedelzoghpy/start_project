
import 'package:bloc/bloc.dart';
import 'package:firstapplication/shared/bloc_observer.dart';
import 'package:firstapplication/shared/cubit/cubit.dart';
import 'package:firstapplication/shared/cubit/states.dart';
import 'package:firstapplication/shared/network/local/cache_helper.dart';
import 'package:firstapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';
import 'layout/todo_app/todo_layout.dart' ;
import 'modules/bmi_app/bmi/BmiScreen.dart';
import 'modules/counter_app/counter/CounterScreen.dart';
import 'modules/basics_app/login/Login.dart';
import 'modules/basics_app/messanger/Messanger.dart';
import 'modules/shop_app/onboarding/onboarding_screen.dart';
import 'modules/basics_app/user/UserScreen.dart';
import 'modules/basics_app/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark=CacheHelper.getData(key:'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget
{
  final  bool? isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context)
  {

    return  MultiBlocProvider(
      providers: [
    BlocProvider(create: (context) =>NewsCubit()..getBusiness()..getScience()..getSports(),
    ),
    BlocProvider(
    create: (context) => AppCubit()
  ..changeAppMode(
              fromCache:isDark,
  ),
    ),
    ],

        child: BlocConsumer<AppCubit,AppStates>(
          listener:(context, state) {} ,
        builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: lightMode ,
              darkTheme: darkMode,
              themeMode:AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light ,
              home: OnBoardingScreen(),
            );
        },
        ),
      );


  }

}


