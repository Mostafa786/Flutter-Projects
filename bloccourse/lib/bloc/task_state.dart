import 'package:bloccourse/model/task_model.dart';
import 'package:equatable/equatable.dart';

sealed class TaskState extends Equatable{
  final List<TaskModel> noteList;
  const TaskState(this.noteList);

  @override
  List<Object?> get props => [noteList]; 
}
class TaskInital extends TaskState{
  const TaskInital():super(const []);
  
}
class TaskUpdate extends TaskState{
  const TaskUpdate(super.noteList);
}