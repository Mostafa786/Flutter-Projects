import 'package:bloccourse/cubit/task_state.dart';
import 'package:bloccourse/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<TaskState>{
  TaskCubit():super(TaskInital());
  void button(){
    emit(TaskUpdate(state.tasks));
    
  }
  void createTask(String title){
    TaskModel model;
    if (state.tasks.isNotEmpty){
    model = TaskModel(id: state.tasks[state.tasks.length-1].id + 1, title: title, isCompleted: false);
    }
    else{
    model = TaskModel(id: 1, title: title, isCompleted: false);
    }
    // final List<TaskModel> newList = state.tasks + [model];
    // emit(TaskUpdate(newList));
  emit(TaskUpdate([...state.tasks,model])); // True
  // emit(TaskUpdate(List.from(state.tasks)..add(model))); // True
  // why we don't use state.tasks.add(model) beacuse state.tasks is final
  }
  void toggleTask(int id){
    final List<TaskModel> newList = state.tasks.map((task){
      return task.id == id ? task.copyWith(isCompleted: !task.isCompleted):task;
    }).toList();
    emit(TaskUpdate(newList));
  }
  void deleteTask(int id){
    final List<TaskModel> newList = state.tasks.where((e)=> e.id != id).toList();
    emit(TaskUpdate(newList));
  }
  void editTask(int id,String newName){
    final List<TaskModel> newList = state.tasks.map((e){
      return e.id == id?e.copyWith(title:newName): e;
    }).toList();
    emit(TaskUpdate(newList));
  }
}