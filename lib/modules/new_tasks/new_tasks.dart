import 'package:alaa_flutter/shared/component/component.dart';
import 'package:alaa_flutter/shared/cubit/cubit.dart';
import 'package:alaa_flutter/shared/cubit/states.dart';
// ignore: unused_import
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewTasks extends StatelessWidget {
  const NewTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      builder: (context,state){
        var tasks = AppCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks);
      },
       listener: (context,state){});
  }
}