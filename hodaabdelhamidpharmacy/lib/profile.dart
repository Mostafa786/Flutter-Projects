import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map userDetails = {
    "Name" : "Mostafa Mahmoud",
    "Phone":"01557509012",
    "Orders":1,
    "Prescriptions":2,
    "Favorites":3,
    "Email":"mostafa@gmail.com",
    "Gender Male":true,
    "Data Of Birth":"26/9/2003",
  }
  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(toolbarHeight: 80,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),backgroundColor: Colors.indigo,centerTitle: true,title: Image.asset(height: 75,"images/Logo-Photoroom2.png"),actions: [InkWell(onTap: (){},child: Container(margin: EdgeInsets.only(top: 8,right: 15),child: Icon(Icons.shopping_cart_rounded,size: 30,)),)],),
    body:Container(padding: EdgeInsets.all(10),child: ListView(physics: BouncingScrollPhysics(),
      children: [
       Container(alignment: Alignment.centerLeft,child: Text(textAlign: TextAlign.left,"Profile",maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w900,fontSize: 35,fontFamily: "Times New Roman"))),
       Container(alignment: Alignment.center,child: ClipRRect(borderRadius: BorderRadius.circular(60),child: userDetails["Gender Male"]?Image.asset(height: 120,"images/man.png"):Image.asset(height: 70,"images/woman.png"))),
       Container(alignment: Alignment.center,child: Text(userDetails["Name"],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25))),
        Container(alignment: Alignment.center,child: Text("Mobile Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey))),
        Container(alignment: Alignment.center,child: Text(userDetails["Phone"],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20))),
        GridView(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent:100,crossAxisSpacing: 10),children: [
            Container(alignment: Alignment.center,decoration:BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(20)),child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(margin: EdgeInsets.only(bottom: 3),child: Text("${userDetails["Orders"]}",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis)),
              Text("My\nOrders",style: TextStyle(fontSize:20),textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis)
            ],)),
            Container(alignment: Alignment.center,decoration:BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(20)),child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(margin: EdgeInsets.only(bottom: 3),child: Text("${userDetails["Prescriptions"]}",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis)),
              Text("My\nPrescriptions",style: TextStyle(fontSize:20),textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis)
            ],),),
            Container(alignment: Alignment.center,decoration:BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(20)),child:Column(mainAxisAlignment: MainAxisAlignment.center,children: [
              Container(margin: EdgeInsets.only(bottom: 3),child: Text("${userDetails["Favorites"]}",textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis)),
              Text("My\nFavorites",style: TextStyle(fontSize:20),textAlign: TextAlign.center,maxLines: 2,overflow: TextOverflow.ellipsis)
            ],),)
        ],),
        InkWell(onTap: (){},
          child: Container(margin: EdgeInsets.only(bottom: 5,top: 10),padding: EdgeInsets.all(15),decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(200)),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(children: [
                  Icon(Icons.location_on_rounded,size: 30,color: Colors.indigo,),
                  Container(width: 200,margin: EdgeInsets.only(left: 5),child: Text("Addresses",style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 25),))
                ],),
              ),
              Container(margin: EdgeInsets.only(right: 5),child: Icon(Icons.arrow_right),)
            ],),width: 500000,),
        ),
      Divider()])));
  }
}
