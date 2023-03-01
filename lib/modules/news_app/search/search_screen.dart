import 'package:firstapplication/layout/news_app/cubit/cubit.dart';
import 'package:firstapplication/layout/news_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();

  @override

  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {} ,
      builder: (context, state) {
        var list=NewsCubit.get(context).search;
        //var isDark;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    defaultformfiled(
                      controller: searchController,
                      //colorBorder: NewsCubit.get(context).isDark?Colors.black:Colors.white,
                      type: TextInputType.text,
                      validate: (value){
                        if(value!.isEmpty){
                          print('Search must not be Empty');
                        }
                        return null;
                        },
                      onChange:(value){

                        NewsCubit.get(context).getSearch(value);
                      },
                      label: 'Search',
                      prefix: Icons.search,
                    ),
                  ],
                ),
              ),
              Expanded(child: articleBuilder(list,context,isSearch: true),),

            ],
          ),
        );
      } ,

    );
  }
}
