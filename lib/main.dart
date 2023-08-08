
// ignore_for_file: unused_import

import 'package:alaa_flutter/layout/news_layout/news_layout.dart';
import 'package:alaa_flutter/layout/todo_layout/todo_layout.dart';
import 'package:alaa_flutter/modules/counter/counter.dart';
import 'package:alaa_flutter/modules/iti/welcome_screen.dart';
import 'package:alaa_flutter/modules/iti/shop_screen.dart';
import 'package:alaa_flutter/shared/networks/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
       appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        elevation: 0.0,
        color: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold 
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        )
       ),
       bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        ),
      ),
      home: HomeScreen(),
    );
  }
}


