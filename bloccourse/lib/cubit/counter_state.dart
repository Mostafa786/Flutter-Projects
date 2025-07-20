// part of 'counter_cubit.dart';

// sealed class CounterState{
//   final int count;
//   final int countTwo;
//   CounterState(this.count , this.countTwo);
// }

// class CounterInit extends CounterState{
//   CounterInit() : super(0,0);

// }
// class CounterUpdate extends CounterState{
//   CounterUpdate(super.count,super.countTwo);
// }
sealed class CounterState{
  final int count;
  CounterState(this.count);
}
class CounterInit extends CounterState{
  CounterInit():super(1);
}
class CounterUpdate extends CounterState{
  CounterUpdate(super.note);
}