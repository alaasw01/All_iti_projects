// Root class:
abstract class CounterStates {}

// inhirate calsses:
class CounterInitialState extends CounterStates{}

class CounterMinusState extends CounterStates{
  final int value;

  CounterMinusState(this.value);
  
}
class CounterPlusState extends CounterStates{
  final int value;

  CounterPlusState(this.value);
}