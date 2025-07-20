import 'package:flutter/material.dart';
import 'package:flutterwithsql/sqldb.dart';

// class HomePage extends StatefulWidget{
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
// class _HomePageState extends State<HomePage>{
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  SqlDB sqlDB = SqlDB();
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(foregroundColor: Colors.white,title: Text("Home Page"),centerTitle: true,backgroundColor: Colors.red,),
    body:Container(alignment: Alignment.topCenter,margin: EdgeInsets.all(10),child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MaterialButton(onPressed: ()async{List<Map> response = await sqlDB.readData("SELECT * FROM 'notes'");
        for(int i=0;i<response.length;i++){
        debugPrint("the note name : ${response[i]["note"]}");
        }
        debugPrint("Read Succefully");
        },
        padding: EdgeInsets.all(10),color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text("Read Data",style: TextStyle(color: Colors.white),)),

        MaterialButton(onPressed: ()async{int response = await sqlDB.insertData("INSERT INTO 'notes' (note) VALUES ('note 32') " );
        debugPrint("the Response : $response");debugPrint("Insert Succefully");
        },
        padding: EdgeInsets.all(10),color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text("Insert Data",style: TextStyle(color: Colors.white),)),

        MaterialButton(onPressed: ()async{int response = await sqlDB.updateData("UPDATE 'notes' SET note = 'note two' WHERE id = 2");
         if (response == 1){
          debugPrint("Update Succefully");        
        }
        else{
          debugPrint("Update Failed");
        }
        
        },
        padding: EdgeInsets.all(10),color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text("Updata Data",style: TextStyle(color: Colors.white),)),

        MaterialButton(onPressed: ()async{int response = await sqlDB.deleteData("DELETE FROM 'notes' WHERE id = 5");
        
        // debugPrint("the Response : $response");
        if (response == 1){
        debugPrint("Delete Succefully");
        }
        else{
          debugPrint("Delete Failed");
        }
        },
        padding: EdgeInsets.all(10),color: Colors.red,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text("Delete Data",style: TextStyle(color: Colors.white),)),
      ],),));
  }
}