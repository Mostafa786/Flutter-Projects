import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';
part 'counter_event.dart';
// import 'counter_state.dart';
class CounterBloc extends Bloc<CounterEvent , CounterState>{
  CounterBloc():super(const CounterInit()){
    on<IncrementEvent>(increment); // True
      // emit(CounterUpdate(state.count+1))
    on<DecrementEvent>((event,emit){   // True
      if (state.count > 0){
      emit(CounterUpdate(state.count-1));
      }
    });
  }
  FutureOr<void> increment(IncrementEvent event , Emitter<CounterState> emit){
    emit(CounterUpdate(state.count+1));
  }
}