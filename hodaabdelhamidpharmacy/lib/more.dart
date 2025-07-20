import 'package:flutter/material.dart';
import 'package:hodaabdelhamidpharmacy/profile.dart';
import 'package:hodaabdelhamidpharmacy/shop.dart';

import 'favorite.dart';
import 'homepage.dart';
import 'offers.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavigationBar(iconSize:28,type: BottomNavigationBarType.fixed,currentIndex:4,onTap: (val){setState(() {
      if(val == 0){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()),(route) => false);
      }
      else if(val == 1){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShopPage()));
      }
      else if(val == 2){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavoritePage()));
      }
      else if(val == 3){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OffersPage()));
      }
      else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MorePage()));
      }
    });},backgroundColor: Colors.indigoAccent,showUnselectedLabels: false,showSelectedLabels: false,landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    items: [
      BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.home_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Home",style: TextStyle(color: Colors.white),))],)),label: "Home"),
      BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.shopping_bag_rounded,color: Colors.white,), Container(margin: EdgeInsets.only(top: 3),child: Text("Shop",style: TextStyle(color: Colors.white),))],)),label: "Shop"),
      BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.favorite_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Favorite",style: TextStyle(color: Colors.white),))],)),label: "Favorite"),
      BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.percent_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Offers",style: TextStyle(color: Colors.white),))],)),label: "Offers"),
      BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),decoration:BoxDecoration(color: Colors.indigo[600],borderRadius: BorderRadius.circular(10)),child: Column(children: [Icon(Icons.more_horiz_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("More",style: TextStyle(color: Colors.white),))],)),label: "More")
    ]),appBar: AppBar(toolbarHeight: 80,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),backgroundColor: Colors.indigo,centerTitle: true,title: Image.asset(height: 75,"images/Logo-Photoroom2.png"),actions: [InkWell(onTap: (){},child: Container(margin: EdgeInsets.only(top: 8,right: 15),child: Icon(Icons.shopping_cart_rounded,size: 30,)),)],),
    body: Container(padding: EdgeInsets.all(10),child: ListView(physics: BouncingScrollPhysics(),
      children: [
        Container(alignment: Alignment.centerLeft,margin: EdgeInsets.symmetric(vertical: 10),child:Text("My Account",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 35,fontFamily: "Times New Roman"))),
        InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));},
          child: Container(padding: EdgeInsets.all(15),decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(200)),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(children: [
                  Icon(Icons.person_2_rounded,size: 30,color: Colors.indigo,),
                  Container(width: 200,margin: EdgeInsets.only(left: 5),child: Text("Profile",style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 25),))
                ],),
              ),
              Container(margin: EdgeInsets.only(right: 5),child: Icon(Icons.arrow_right),)
            ],),width: 500000,),
        ),
        InkWell(onTap: (){},
          child: Container(margin: EdgeInsets.symmetric(vertical: 15),padding: EdgeInsets.all(15),decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(200)),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(children: [
                  Icon(Icons.shopify_rounded,size: 30,color: Colors.indigo,),
                  Container(width: 200,margin: EdgeInsets.only(left: 5),child: Text("My Orders",style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 25),))
                ],),
              ),
              Container(margin: EdgeInsets.only(right: 5),child: Icon(Icons.arrow_right),)
            ],),width: 500000,),
        ),
        InkWell(onTap: (){},
          child: Container(margin: EdgeInsets.only(bottom: 5),padding: EdgeInsets.all(15),decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(200)),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Divider(),
        Container(alignment: Alignment.centerLeft,margin: EdgeInsets.only(bottom: 10),child:Text("Language",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 35,fontFamily: "Times New Roman"))),
        InkWell(onTap: (){},
          child: Container(padding: EdgeInsets.all(15),decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(200)),child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child:
                  Container(width: 200,margin: EdgeInsets.only(left: 5),child: Text("English",style: TextStyle(overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 25),))
              ),
              Container(margin: EdgeInsets.only(right: 5),child: Icon(Icons.arrow_right),)
            ],),width: 500000,),
        ),
      ],),),);
  }
}
