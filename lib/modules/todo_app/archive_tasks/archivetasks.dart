import 'package:firstapplication/shared/components/components.dart';
import 'package:firstapplication/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/cubit/states.dart';


class NewAchriveScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStates>(

        builder:(context, state) {
          var tasks =AppCubit.get(context).ArchiveTasks;

          return TasksBuilder(tasks: tasks);

        } ,
        listener: (context, state){},
      );
  }
}
