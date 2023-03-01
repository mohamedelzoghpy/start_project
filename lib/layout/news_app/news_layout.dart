import 'package:firstapplication/layout/news_app/cubit/cubit.dart';
import 'package:firstapplication/layout/news_app/cubit/states.dart';
import 'package:firstapplication/shared/cubit/cubit.dart';
import 'package:firstapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_app/search/search_screen.dart';
import '../../shared/components/components.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state) {} ,
        builder: (context, state)  {
          var cubit = NewsCubit.get(context);
          return  Scaffold(

            appBar: AppBar(
              title: const Text(
                  'News App'
              ),
              actions: [
                IconButton(
                    onPressed: (){
                      navigateTo(context,SearchScreen());
                    },
                    icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();

                  },
                  icon: const Icon(Icons.brightness_auto),
                ),

              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
                onTap: (index){
                cubit.ChanageBottomNavBar(index);
                },
                items:cubit.bottomItems,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      );

  }
}
