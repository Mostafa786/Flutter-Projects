// import 'package:bloccourse/bloc/counter_bloc.dart';
// import 'package:bloccourse/model/user.dart';
// import 'package:bloccourse/cubit/counter_cubit.dart';
// import 'package:bloccourse/cubit/counter_state.dart';
import 'package:bloccourse/bloc/task_event.dart';
import 'package:bloccourse/cubit/button_cubit.dart';
import 'package:bloccourse/cubit/button_state.dart';
import 'package:bloccourse/bloc/task_bloc.dart';
import 'package:bloccourse/bloc/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});
  TextEditingController theNote = TextEditingController();
  String note = "";
  List notes = []; 
  
  // User user1 = User(1,"Mostafa");
  // User user2 = User(1,"Mostafa");
 @override
 Widget build(BuildContext context){
  // debugPrint((user1 == user2).toString());
  // debugPrint(user1.hashCode.toString());
  // debugPrint(user2.hashCode.toString());
  // String testing = "GeneshOnBloc";
  // debugPrint("Genesh");
  // return BlocProvider(create: (context)=>CounterBloc(),
  // child: Scaffold(appBar: AppBar(title: Text("Home Page"),backgroundColor: Colors.blue,foregroundColor: Colors.white,),
  // body:Container(margin: EdgeInsets.all(10),
  // child:Row(mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     BlocBuilder<CounterBloc ,CounterState>(builder: (context, state){
  //   debugPrint("Mostafa");
  //   return IconButton(onPressed: (){
  //       context.read<CounterBloc>().add(DecrementEvent());
  //     }, icon: Icon(Icons.remove));}),
      
  //     BlocBuilder<CounterBloc , CounterState>(builder: (context, state){
  //   debugPrint("Mostafa1");
  //   return Text("Counter : ${state.count}");}),

  //     BlocBuilder<CounterBloc , CounterState>(builder: (context, state){
  //   debugPrint("Mostafa2");
  //   return IconButton(onPressed: (){
  //       context.read<CounterBloc>().add(IncrementEvent());
  //     }, icon: Icon(Icons.add));}),
  //   ],
  // ),
  // )
  // )
  return BlocProvider(create: (context) => ButtonCubit(),
  child: BlocProvider(create: (context) => TaskBloc(),
  child:Scaffold(appBar: AppBar(title: Text("To Do List"), backgroundColor: Colors.orange,foregroundColor: Colors.white),
  body: Padding(padding: EdgeInsets.all(10),
  child: BlocBuilder<ButtonCubit,ButtonState>(builder: (BuildContext context, state) { 
      return BlocBuilder<TaskBloc,TaskState>(builder: (BuildContext context, state) { 
      return ListView(physics: BouncingScrollPhysics(),
    children: [
       TextField(controller: theNote,decoration:InputDecoration(hintText: "note",border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),onChanged: (val){
        note = val;
        context.read<ButtonCubit>().buttonStatus(note);
      },),
       MaterialButton(onPressed:theNote.text != "" ?(){context.read<TaskBloc>().add(AddEvent(noteName: theNote.text));theNote.text = "";}:null
      ,color: theNote.text != ""?Colors.orange:Colors.grey,shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),child: Text("Add note"),),
      Divider(),
      ListView.builder(itemCount: state.noteList.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context, index) {
        return Row(mainAxisSize: MainAxisSize.min,children:[Expanded(
          child: Card(child:ListTile(trailing:  IconButton(onPressed: (){
            if(state.noteList[index].title != "theNewName"){
              context.read<TaskBloc>().add(EditEvent(id:state.noteList[index].id, newTitle:"theNewName"));
            }
            else{
              context.read<TaskBloc>().add(EditEvent(id:state.noteList[index].id, newTitle:"theOldName"));
            }}, icon: Icon(Icons.edit_rounded)),subtitle:Text(state.noteList[index].id.toString()),title: Text(state.noteList[index].title,style: TextStyle(decoration: state.noteList[index].isCompleted?TextDecoration.lineThrough:null),),
          leading: IconButton(onPressed: (){context.read<TaskBloc>().add(ToggleEvent(id:state.noteList[index].id));},
          icon: !state.noteList[index].isCompleted?Icon(Icons.check_box_outline_blank_rounded):Icon(Icons.check_box_rounded,color: Colors.green)),))),
          IconButton(onPressed: (){context.read<TaskBloc>().add(DeleteEvent(id:state.noteList[index].id));},
          icon: Icon(Icons.delete,color: Colors.red,))]);
      },),
    ],);
  });
  }))
 )));
 }
  
}