import 'package:bloccourse/model/task_model.dart';
import 'package:equatable/equatable.dart';

sealed class TaskState extends Equatable{
  final List<TaskModel> tasks;
  const TaskState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}
class TaskInital extends TaskState{
  TaskInital():super([]);
}
class TaskUpdate extends TaskState{
  const TaskUpdate(super.tasks);
}