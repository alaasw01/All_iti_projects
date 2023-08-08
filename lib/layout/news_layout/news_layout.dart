// ignore_for_file: unused_import

import 'package:alaa_flutter/layout/news_layout/cubit/cubit.dart';
import 'package:alaa_flutter/layout/news_layout/cubit/state.dart';
import 'package:alaa_flutter/shared/networks/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
       NewsCubit cubit =NewsCubit.get(context);
       return 
          Scaffold(        
          appBar: AppBar(
            title: Text('News app'),
            actions: [IconButton(onPressed: (){}, icon:Icon(Icons.search))],
          ),
          bottomNavigationBar:BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeIndex(index);
            },
            items: cubit.bottomItem,
            ),
            body: Center(child: cubit.screens[cubit.currentIndex]),
        );
        }
      ),
    );
  }
}