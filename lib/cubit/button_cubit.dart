import 'package:bloccourse/cubit/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<ButtonState>{
  ButtonCubit():super(ButtonInit());
  void buttonStatus(note){
      emit(ButtonUpdate(note));
  }
}