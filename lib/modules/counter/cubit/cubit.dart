
import 'package:alaa_flutter/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{
 CounterCubit():super(CounterInitialState());
 // create object to use it for many places:
 static CounterCubit get(context)=>BlocProvider.of(context);
 // variables + functions:
 int counter=1;
 void minus(){
  counter--;
  emit(CounterMinusState(counter));
 }
 void plus(){
  counter++;
  emit(CounterPlusState(counter));
 }
}