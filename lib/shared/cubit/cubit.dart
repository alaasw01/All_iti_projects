import 'package:alaa_flutter/shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/archived_tasks/archived_tasks.dart';
import '../../modules/done_tasks/done_tasks.dart';
import '../../modules/new_tasks/new_tasks.dart';


class AppCubit extends Cubit<AppStates>{
AppCubit():super(AppInitialState());
static AppCubit get(context)=> BlocProvider.of(context);
int currentIndex = 0;
late Database database;
bool isBottomSheetShow = false;
IconData fabIcon = Icons.edit;
List<Map> newTasks=[];
List<Map> doneTasks=[];
List<Map> archivedTasks=[];
List<Widget> screens = [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  void changeIndex (int index){
    currentIndex=index;
    emit(ChangeBottomNavBarState());
  }

  void createDB(){
    // ignore: unused_local_variable
    openDatabase(
      'ToDo.db',
      version: 1,
      onCreate: (database, version) {
        print('create Database ');
        database.execute(
                'create table tasks(id integer primary key,title text,date text,time text,status text)')
            .then((value) {
          print('create tables');
        }).catchError((error) {
          print('Error in created tables ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDB(database);
        print('database opened');
      },
    ).then((value){
      database=value;
      emit(CreateDBState());
    });
  }

  Future insertIntoDB({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) {
      return txn.rawInsert(
              'insert into tasks(title,date,time,status) values("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted sucessfuly');
        emit(InsertIntoDBState());
         getDataFromDB(database);
      }).catchError((error) {
        print('Error in inserted raw ${error.toString()}');
      });
    });
  }

  void  getDataFromDB(database)  {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];
    emit(lodingDataState());
     database.rawQuery('select * from tasks').then((value) {
           value.forEach((element) {
            if(element['status']=='new'){
              newTasks.add(element);
            } else if(element['status']=='done'){
              doneTasks.add(element);
            }else{
              archivedTasks.add(element);
            }
          });
          emit(GetDataDBState());
        });
  }

  void updateData(
    {
      required String status,
      required int id,
    }
  )async{
   database.rawUpdate(
    'UPDATE tasks SET status = ? WHERE id = ?',
    ['$status', id]).then((value){
      getDataFromDB(database) ;
      emit(UpdateDataDBState());
    });
  }

  void deleteData(
    {
      required int id,
    }
  )async{
   database.rawDelete(
    'Delete FROM tasks  WHERE id = ?',
    [id]).then((value){
      getDataFromDB(database) ;
      emit(DeleteDataDBState());
    });
  }

  void changeBottomSheet({
    required bool isShow ,
    required IconData icon,
  }){
  isBottomSheetShow=isShow;
  fabIcon=icon;
  emit(changebottomSheetState());
  }

}