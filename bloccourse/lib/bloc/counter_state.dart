part of 'counter_bloc.dart';
// import 'counter_event.dart';
// import 'counter_bloc.dart';

sealed class CounterState extends Equatable{
  final int count;
  const CounterState(this.count);
    
  @override
  List<Object?> get props => [count];
}
class CounterInit extends CounterState{
  const CounterInit():super(1);

}
class CounterUpdate extends CounterState{
  const CounterUpdate(super.count);
  
}