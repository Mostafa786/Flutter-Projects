import 'package:flutter/Material.dart';
import 'package:flutterwithsql/sqldb.dart';
// import 'package:flutterwithsql/sqldb2.dart';

class HomePageTwo extends StatefulWidget{
  const HomePageTwo({super.key});
  @override
  State<HomePageTwo> createState() => _HomePageTwoState();
}
class _HomePageTwoState extends State<HomePageTwo>{
  SqlDB sqlDB = SqlDB();
  GlobalKey<FormState> insert = GlobalKey();
  GlobalKey<FormState> update = GlobalKey();
  GlobalKey<FormState> delete = GlobalKey();
  TextEditingController noteName = TextEditingController();
  TextEditingController updateNoteName = TextEditingController();
  TextEditingController idNote = TextEditingController();
  TextEditingController idNoteDelete = TextEditingController();
  bool statusDatabase = false;
  late int idNum;


  // Future<List<Map>> readData()async{
  //   List<Map> response = await sqlDB.readData("SELECT * FROM 'marks'");
  //   return response;
  // }
  // Future<String> insertData(String name,int arabic , int english , int frensh , int chimestry , int physics , int math)async{
  //   String response = await sqlDB.insertData("""
  //       INSERT INTO 'marks' (name , arabic , english , frensh , chimestry , physics , math) 
  //       VALUES ($name , $arabic , $english , $frensh , $chimestry , $physics , $math)
  //       """);
  //   return response;
  // }
  // Future<String> updateData(String subject , int updatedValue , int idNum)async{
  //   String response = await sqlDB.updateData("UPDATE 'marks' SET $subject = $updatedValue WHERE id = $idNum");
  //   return response;
  // }
  // Future<String> deleteData(int idNum)async{
  //   String response = await sqlDB.deleteData("DELETE FROM 'marks' Where id = $idNum");
  //   return response;
  // }
  List notes = [];

  Future readData()async{
    // List<Map> response = await sqlDB.readData("SELECT * FROM 'notes'"); // manual
    List<Map> response = await sqlDB.read("notes"); // automatic
    // notes.addAll(response);
    notes = response.map((e)=>Map.from(e)).toList();
    idNum = notes[notes.length-1]["id"];
    statusDatabase = true;
    if(mounted){
      setState(() {
        
      });
    } 
  }
  @override
  void initState(){
    readData();
    super.initState();
  }
  insertData(List note)async{
    // List<String> details =note.split(","); 
    // idNum = await sqlDB.insertData("INSERT INTO 'notes' (note , color) VALUES ('${note[0]}' , '${note[1]}')");  //manual
      idNum = await sqlDB.insert("notes", {
        "note":note[0],
        "color":note[1]
      }); // automatic
    // return response;
  }

  updateData(String updatedName , int idNum)async{
    // await sqlDB.updateData("UPDATE 'notes' SET note = '$updatedName' WHERE id = $idNum");  // manual
    await sqlDB.update("notes", {
      "note":updatedName
    },"id = $idNum");
    // return response;
  }

  deleteData(int idNum)async{
    // await sqlDB.deleteData("DELETE FROM 'notes' WHERE id = $idNum");
    await sqlDB.delete("notes", "id = $idNum");
    // return response;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(foregroundColor: Colors.white,title: Text("Home Page 2"),centerTitle: true,backgroundColor: Colors.red,),
    body:Container(alignment: Alignment.topCenter,margin: EdgeInsets.all(10),
    child: ListView(
      children: [
        // if(statusDatabase)FutureBuilder(future: readData(),builder:(BuildContext context ,AsyncSnapshot<List<Map>> snapshot){
        //   if (snapshot.hasData){
        //     return ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: snapshot.data!.length,itemBuilder: (context, index){
        //       return Container(margin: EdgeInsets.symmetric(vertical: 3),child: Card(child: Container(padding: EdgeInsets.all(5),child: ListTile(title:Text("${snapshot.data![index]["note"]}"),subtitle: Text("${snapshot.data![index]["color"]}"),trailing: Text("${snapshot.data![index]["id"]}"),))));
        //     },);
        //   }
        //   return Container(alignment: Alignment.topCenter,margin: EdgeInsets.only(top: 10,bottom: 10),child: CircularProgressIndicator(),);
        // }),
        statusDatabase?ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: notes.length,itemBuilder: (context,index){
          return Container(margin: EdgeInsets.symmetric(vertical: 3),child: Card(child: Container(padding: EdgeInsets.all(5),
          child: ListTile(title:Text("${notes[index]["note"]}"),subtitle: Text("${notes[index]["color"]}"),
          trailing: Row(mainAxisSize: MainAxisSize.min,
            children: [
              Container(margin: EdgeInsets.only(right: 5),child: Text("${notes[index]["id"]}")),
              // IconButton(onPressed: (){}, icon: Icon(Icons.edit,color:Colors.blueAccent)),
              IconButton(onPressed: ()async{
                await deleteData(notes[index]["id"]);
                notes.removeWhere((element) => (element["id"]) == notes[index]["id"]);
                setState(() {

                });
          }, icon: Icon(Icons.delete,color: Colors.red,)),
            ],
          ),))));
        }):Container(alignment: Alignment.topCenter,margin: EdgeInsets.only(top: 10,bottom: 10),child: CircularProgressIndicator(),),
        Column(
          children: [
            Form(key: insert,autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),controller:noteName ,onSaved: (newValue) {
                  noteName.text = newValue!;
                },validator: (value) {
                  if(value!.isEmpty){
                    return "Empty Field";
                  }
                  return null;
                },autovalidateMode: AutovalidateMode.onUserInteraction,),
                MaterialButton(onPressed:()async{
                  if(insert.currentState!.validate()){
                    insert.currentState!.save();
                    List<String> details = noteName.text.split(",");
                    await insertData(details);
                    debugPrint("$notes");
                    notes.add({"id" : idNum , "note" : details[0] , "color" : details[1]});
                    setState(() {
                      statusDatabase = true;
                    });
                     if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Insert is done"),duration: Duration(seconds: 5),action: SnackBarAction(label: "Ok", onPressed: (){}),shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20)),dismissDirection: DismissDirection.down,));

                  }
                },child: Text("insert"))
              ],
            )
            ),
            Form(key: update,autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),controller:updateNoteName ,onSaved: (newValue) {
                  updateNoteName.text = newValue!;
                },validator: (value) {
                  if(value!.isEmpty){
                    return "Empty Field";
                  }
                  return null;
                },autovalidateMode: AutovalidateMode.onUserInteraction,),
                Container(margin: EdgeInsets.only(top:10),
                  child: TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),controller:idNote ,onSaved: (newValue) {
                    idNote.text = newValue!;
                  },validator: (value) {
                    if(value!.isEmpty){
                      return "Empty Field";
                    }
                    return null;
                  },autovalidateMode: AutovalidateMode.onUserInteraction,),
                ),
                MaterialButton(onPressed: ()async{
                  if(update.currentState!.validate()){
                    update.currentState!.save();
                    await updateData(updateNoteName.text , int.parse(idNote.text));
                    // notes.singleWhere((element)=>element["id"] == int.parse(idNote.text));
                    for(int i = 0; i<notes.length;i++){
                      debugPrint(notes[i]["id"].toString());
                      if(notes[i]["id"].toString() == idNote.text){
                        notes[i]["note"] = updateNoteName.text;
                      }
                    }
                    setState(() {
                      
                    });
                  }
                },child: Text("update"))
              ],
            )
            ),
            Form(key:delete,autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),controller:idNoteDelete ,onSaved: (newValue) {
                  idNoteDelete.text = newValue!;
                },validator: (value) {
                  if(value!.isEmpty){
                    return "Empty Field";
                  }
                  return null;
                },autovalidateMode: AutovalidateMode.onUserInteraction,),
                MaterialButton(onPressed: ()async{
                  if(delete.currentState!.validate()){
                  delete.currentState!.save();
                    await deleteData(int.parse(idNoteDelete.text));
                    notes.removeWhere((element) => (element["id"]).toString() == idNoteDelete.text);
                    // String name = "mostafa";
                    // debugPrint(notes[0]["id"].toString().runtimeType.toString());
                    setState(() {
                      
                    });
                  }
                },child: Text("delete"))
              ],
            )
            ),
          ],
        ),

      //   MaterialButton(padding: EdgeInsets.all(10),onPressed: ()async{
      //     List<Map>response = await sqlDB.readData("SELECT * FROM 'marks'"); 
      //   for(int i = 0;i<response.length;i++){
      //     debugPrint('the name ${i+1} : ${response[i]["name"]}');
      //   }
      //   },color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //   child: Text("Read Data")),

      //   MaterialButton(padding: EdgeInsets.all(10),
      //   onPressed: ()async{String response = await sqlDB.insertData("""
      //   INSERT INTO 'marks' (name , arabic , english , frensh , chimestry , physics , math) 
      //   VALUES ('Mostafa Mahmoud' , 51 , 35 , 36 , 54 , 50 , 103)
      //   """
      // );debugPrint(response);},
      //   color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //   child: Text("insert Data")),

      //   MaterialButton(padding: EdgeInsets.all(10),onPressed: ()async{String response = await sqlDB.updateData("UPDATE 'marks' SET arabic = 60 WHERE id = 1");debugPrint(response);},color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      //   child: Text("updata Data")),

        MaterialButton(padding: EdgeInsets.all(10),onPressed: ()async{await sqlDB.mydeleteDatabase();setState(() {
          statusDatabase = true;
        });},color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text("delete DataBase")),
      ],))
    );
  }
}