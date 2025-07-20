// import 'package:bloccourse/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// part 'counter_state.dart';


// class CounterCubit extends Cubit<CounterState>{
//   CounterCubit():super(CounterInit()); // this true or CounterCubit(super.initialState); 
//   void increment1(){
//     // emit(); علشان تغير في ال UI
//     emit(CounterUpdate(state.count + 1,state.countTwo));
//   }
//   void decrement1(){
//     emit(CounterUpdate(state.count-1 , state.countTwo));
//   }
//   void increment2(){
//     emit(CounterUpdate(state.count, state.countTwo + 1));
//   }
//   void decrement2(){
//     emit(CounterUpdate(state.count, state.countTwo - 1));
//   }
// }
// class CounterCubit extends Cubit<CounterState>{
//   CounterCubit():super(CounterInit());
//   void increment(){
//     emit(CounterUpdate(state.count+1));
//   }
//   void decrement(){
//     if (state.count > 0){
//     emit(CounterUpdate(state.count-1));
//     }
//   }
// }
class CounterCubit extends Cubit<int>{
  CounterCubit():super(0);
  void increment(){
    emit(state+1);
  }
  void decrement(){
    if (state > 0){
    emit(state-1);
    }
  }
}