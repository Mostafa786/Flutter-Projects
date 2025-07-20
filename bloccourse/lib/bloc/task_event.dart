sealed class TaskEvent {}
class AddEvent extends TaskEvent{
  String noteName;
  AddEvent({required this.noteName});
}
class ToggleEvent extends TaskEvent{
  int id;
  ToggleEvent({required this.id});
}
class EditEvent extends TaskEvent{
  int id;
  String newTitle;
  EditEvent({required this.id , required this.newTitle});
}
class DeleteEvent extends TaskEvent{
  int id;
  DeleteEvent({required this.id});
}