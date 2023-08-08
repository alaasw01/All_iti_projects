
import 'package:alaa_flutter/layout/news_layout/cubit/state.dart';
import 'package:alaa_flutter/modules/news_screens/business_screen.dart';
import 'package:alaa_flutter/modules/news_screens/science_screen.dart';
import 'package:alaa_flutter/modules/news_screens/setting_screen.dart';
import 'package:alaa_flutter/modules/news_screens/sport_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/networks/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomItem=[
    BottomNavigationBarItem(icon:Icon(Icons.business) ,label: 'Business',),
    BottomNavigationBarItem(icon:Icon(Icons.sports_football_rounded) ,label: 'Sports',),
     BottomNavigationBarItem(icon:Icon(Icons.science) ,label: 'Science',),
     BottomNavigationBarItem(icon:Icon(Icons.settings) ,label: 'Settings',),
  ];
 int  currentIndex=0;
 List<Widget> screens=[
  BusinessScreen(),
  SportScreen(),
  ScienceScreen(),
  SettingScreen(),
 ];

 void changeIndex(int index){
  currentIndex=index;
  emit(NewsbottomNavState());
 }

List <dynamic> business=[];

 void getBusiness(){
  emit(LoadingDataState());
  DioHelper.getData(
                url: 'v2/top-headlines',
               query: {
               'country':'us',
               'category':'business',
               'apiKey':'cce9f2fc06dc41e396743236958178c8',
               },
                ).then((value) {
                  //print(value.data['articles'][0]['title']);
                  business=value.data['articles'];
                  print(business[0]['title']);
                  emit(NewsgetBusinessSuccessState());
                }).catchError((e){
                  print(e.toString());
                  emit(NewsgetBusinessErrorState(e));
                });
 }

}