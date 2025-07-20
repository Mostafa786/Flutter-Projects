sealed class ButtonState {
  String note;
  ButtonState(this.note);
}
class ButtonInit extends ButtonState{
  ButtonInit():super("");
}
class ButtonUpdate extends ButtonState{
  ButtonUpdate(super.note);
}