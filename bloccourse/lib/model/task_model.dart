class TaskModel{
  final int id;
  final String title;
  final bool isCompleted;
  const TaskModel({required this.id,required this.title, required this.isCompleted});
  // const TaskModel(this.id, this.title, this.isCompleted); //this with TaskModel() and add paremters TaskModel("genesh") not TaskModel(name:"genesh")
  

TaskModel copyWith({
  int? id,
  String? title,
  bool? isCompleted
}){
  return TaskModel(id:id??this.id , title:title??this.title , isCompleted: isCompleted ?? this.isCompleted);
}
}