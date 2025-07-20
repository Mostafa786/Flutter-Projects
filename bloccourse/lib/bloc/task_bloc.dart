import 'dart:async';

import 'package:bloccourse/bloc/task_event.dart';
import 'package:bloccourse/bloc/task_state.dart';
import 'package:bloccourse/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent,TaskState>{
  TaskBloc():super(const TaskInital()){
  on<AddEvent>(addTask);
  on<ToggleEvent>((event,emit){
    List<TaskModel>newList = state.noteList.map((e)=>e.id == event.id ? e.copyWith(isCompleted: !e.isCompleted): e).toList();
    emit(TaskUpdate(newList));
  });
  on<EditEvent>((event,emit){
    List<TaskModel>newList = state.noteList.map((e)=>e.id == event.id? e.copyWith(title: event.newTitle):e).toList();
    emit(TaskUpdate(newList));
  });
  on<DeleteEvent>((event,emit){
    List<TaskModel> newList = state.noteList.where((e)=>e.id != event.id).toList();
  emit(TaskUpdate(newList));
  });
}
  FutureOr<void> addTask(AddEvent event ,Emitter<TaskState> emit){
    TaskModel model;
    if (state.noteList.isNotEmpty){
    model = TaskModel(id: state.noteList[state.noteList.length-1].id + 1, title: event.noteName, isCompleted: false);
    }
    else{
    model = TaskModel(id: 1, title: event.noteName, isCompleted: false);
    }
    emit(TaskUpdate([...state.noteList,model]));
}
}
