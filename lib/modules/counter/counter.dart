import 'package:alaa_flutter/modules/counter/cubit/cubit.dart';
import 'package:alaa_flutter/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class Counter extends StatelessWidget {
  int num=1;
  @override
 Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
       listener: (context,state){
        if(state is CounterMinusState){
          print('Minus state ${state.value}');
        }
        if(state is CounterPlusState){
          print('Plus state ${state.value}');
        }
       },
       builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: Text("Counter"),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: (){
                   CounterCubit.get(context).minus();
                  }, 
                  child: Text('MINUS'),
                  ),
               
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: (){
                     CounterCubit.get(context).plus();
                  }, 
                  child: Text('PLUS'),
                  ),
                
                ],
            ),
          ),
        );
       },
      ),
    );
  }
}



