// ignore_for_file: prefer_const_constructors, unused_import

import 'package:alaa_flutter/modules/archived_tasks/archived_tasks.dart';
import 'package:alaa_flutter/modules/done_tasks/done_tasks.dart';
import 'package:alaa_flutter/modules/new_tasks/new_tasks.dart';
import 'package:alaa_flutter/shared/component/constant.dart';
import 'package:alaa_flutter/shared/cubit/cubit.dart';
import 'package:alaa_flutter/shared/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget  {
  

  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
 
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AppCubit()..createDB() ,
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){
          if(state is InsertIntoDBState){
             Navigator.pop(context); 
          }
        },
        builder: (context, state) {
          AppCubit cubit=AppCubit.get(context);
          return Scaffold(
          key: ScaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          body: ConditionalBuilder(
            condition: state is! lodingDataState,
            builder: (context) => cubit.screens[cubit.currentIndex],
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.pink,
            onPressed: () {
              if (cubit.isBottomSheetShow) {
                if (formKey.currentState!.validate()) {
                  cubit.insertIntoDB(title: titleController.text, date: dateController.text, time: timeController.text);
                
                }
              } else {
                ScaffoldKey.currentState!
                    .showBottomSheet(
                      elevation: 20.0,
                      (context) => Container(
                        padding: EdgeInsets.all(20.0),
                        color: Colors.white,
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: titleController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.title),
                                  labelText: 'Title',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Title must be not empty';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: dateController,
                                keyboardType: TextInputType.datetime,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2023-07-30'),
                                  ).then((value) {
                                    dateController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_today_rounded),
                                  labelText: 'Date',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Date must be not empty';
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                controller: timeController,
                                keyboardType: TextInputType.datetime,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeController.text =
                                        value!.format(context).toString();
                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.watch),
                                  labelText: 'Time',
                                ),
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Time must be not empty';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                      cubit.changeBottomSheet(isShow:false, icon: Icons.edit);
                });
                cubit.changeBottomSheet(isShow:true, icon: Icons.add);
              }
            },
            child: Icon(cubit.fabIcon),
          ),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.pink,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
               cubit.changeIndex(index);
              },
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'archived'),
              ]),
        );
        },
      ),
    );
  }
}


