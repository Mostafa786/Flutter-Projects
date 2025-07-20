import 'package:flutter/material.dart';
import 'package:hodaabdelhamidpharmacy/bestSell.dart';
import 'package:hodaabdelhamidpharmacy/category.dart';
import 'package:hodaabdelhamidpharmacy/shop.dart';

import 'favorite.dart';
import 'more.dart';
import 'offers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List Services = [
     {
     "Services Name":"Medicine",
     "Services Image":"images/drugs.png",
     "Function":[ShopPage(),Categorypage(category: "Medications")]
     },
     {
       "Services Name":"Pharmacy\nPickup",
       "Services Image":"images/pharmacy.png",
       "Function":[]
     },
     {
       "Services Name":"veterinary",
       "Services Image":"images/vet.png",
       "Function":[ShopPage(),Categorypage(category: "veterinary")]
     }
   ];
   List Product = [
     {
     "Image":"images/Cipro.png",
     "Drug Name":"Cipro 500mg 10 Tablets",
     "Drug Category":"Anti Bacterial",
     "Favorite":false,
     "Best Seller" : true,
     "Special Offer" : "25% Discount",
     "Drug Price":149
     },
     {
       "Image":"images/Neozolid.png",
       "Drug Name":"Neozolid 600mg 3 Tablet",
       "Drug Category":"Anti Bacterial",
       "Favorite":false,
       "Best Seller" : false,
       "Special Offer" : "50% Discount"
       ,"Drug Price":199
     },
     {
       "Image":"images/Levoxin.png",
       "Drug Name":"Levoxin 500mg 5 Tablets",
       "Drug Category":"Anti Bacterial",
       "Favorite":false,
       "Best Seller" : true,
       "Special Offer" : ""
       ,"Drug Price":99
     },
     {
       "Image":"images/Respenzo.png",
       "Drug Name":"Respenzo 600mg 10 Tablets",
       "Drug Category":"Anti Bacterial",
       "Favorite":false,
       "Best Seller" : true,
       "Special Offer" : ""
       ,"Drug Price":299
     },
   ];
   List bestSell = [];
   BestSell_Function_detect(){
     for(int i = 0;i<Product.length;i++){
     if(Product[i]["Best Seller"] && bestSell.length <2){
       bestSell.addAll([Product[i]]);
     }
   }
   }
   @override
  void initState() {
     BestSell_Function_detect();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavigationBar(iconSize:28,type: BottomNavigationBarType.fixed,currentIndex:0,onTap: (val){setState(() {
      if(val == 0){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MorePage()));
      }
    });},backgroundColor: Colors.indigoAccent,showSelectedLabels: false,showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),decoration:BoxDecoration(color: Colors.indigo[600],borderRadius: BorderRadius.circular(10)),child: Column(children: [Icon(Icons.home_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Home",style: TextStyle(color: Colors.white),))],)),label: "Home"),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.shopping_bag_rounded,color: Colors.white,), Container(margin: EdgeInsets.only(top: 3),child: Text("Shop",style: TextStyle(color: Colors.white),))],)),label: "Shop"),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.favorite_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Favorite",style: TextStyle(color: Colors.white),))],)),label: "Favorite"),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.percent_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Offers",style: TextStyle(color: Colors.white),))],)),label: "Offers"),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.more_horiz_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("More",style: TextStyle(color: Colors.white),))],)),label: "More")
        ]),
      appBar: AppBar(toolbarHeight: 195,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),backgroundColor: Colors.indigo,
      title: Container(padding: EdgeInsets.all(0),margin: EdgeInsets.all(0),height: 180,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(alignment: Alignment.topCenter,child:Image.asset(height:75,"images/Logo-Photoroom2.png"),),
              Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(children: [
                  Text("Welcome ",style: TextStyle(fontWeight: FontWeight.w900),),
                  Container(width: 130,child: Text("Mostafa Mahmoud Mahmoud",overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w600),)),
                ],),
                InkWell(onTap: (){},child: Icon(size: 30,Icons.shopping_cart_rounded))
              ],),

            Container(decoration: BoxDecoration(color: Colors.grey[350],borderRadius: BorderRadius.circular(10)),
                child: TextFormField(decoration: InputDecoration(suffixIcon: Icon(Icons.search_rounded),hintText: "Search",fillColor: Colors.grey[300],
                    border: OutlineInputBorder(borderSide: BorderSide(width: 100),borderRadius: BorderRadius.circular(10))),))
          ],),
      )
    ),
      body: Container(
        padding: EdgeInsets.all(10),child: ListView(
      physics: PageScrollPhysics(),
    children: [
      Container(width: 50,child: Text(overflow: TextOverflow.ellipsis,"Services",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 35,fontFamily: "Times New Roman"),),),
      Container(margin: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: Services.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),itemBuilder: (context, index) {
          return Column(
            children: [
              Container(padding: EdgeInsets.all(15),decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey[300]),
                child:InkWell(onTap: (){
                  for(int i=0;i<Services[index]["Function"].length;i++){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Services[index]["Function"][i]));
                  }
                },child: Image.asset(height: 60,fit: BoxFit.cover,Services[index]["Services Image"])),),
              Text("${Services[index]["Services Name"]}",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2)
            ],
          );
        },),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Container(width: 190,child: Text(overflow: TextOverflow.ellipsis,"Best Selling",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 35,fontFamily: "Times New Roman"),),),
        InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BestSellPage()));},
          child: Row(
            children: [
              Text("See More",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.indigo,fontSize: 25,fontFamily: "Times New Roman"),),
              Text(">>",style: TextStyle(fontWeight:FontWeight.w900,color: Colors.indigo,fontSize: 35))
            ],
          ),
        ),
      ],),
      GridView.builder(itemCount: bestSell.length,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 450),itemBuilder: (context, index) {
      return Container(child: Card(child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 250,
            child: Stack(
              children: [
                Image.asset(bestSell[index]["Image"],height: 300,),
              if(bestSell[index]["Best Seller"])Positioned(right: 0,top: 0,child:Container(margin: EdgeInsets.only(right: 5,top: 5),padding: EdgeInsets.all(7),decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(30)),child: Text("Best Seller",style: TextStyle(color: Colors.white),),)),
              if(bestSell[index]["Special Offer"] != "")Positioned(right: 0,bottom: 0,child:Container(padding: EdgeInsets.only(top:5,left: 5),width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),color: Colors.redAccent,backgroundBlendMode: BlendMode.hardLight),child: Text(bestSell[index]["Special Offer"],maxLines: 2,overflow: TextOverflow.ellipsis),)),
              Positioned(left: 0,top: 0,child:Container(margin: EdgeInsets.only(left: 10,top: 10),child:InkWell(onTap: (){setState(() {
                bestSell[index]["Favorite"] = !bestSell[index]["Favorite"];
              });},child:bestSell[index]["Favorite"]?Icon(Icons.favorite_rounded,color: Colors.red,):Icon(Icons.favorite_border_rounded)))),
            ],),
          ),
        Container(margin: EdgeInsets.only(left: 5),alignment: Alignment.centerLeft,child: Text("${bestSell[index]["Drug Name"]}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 2,)),
        Container(margin: EdgeInsets.only(left: 5),alignment: Alignment.centerLeft,child: Text("${bestSell[index]["Drug Category"]}",style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 1,),),
        Container(margin: EdgeInsets.only(left: 5),alignment: Alignment.centerLeft,child: Text("${bestSell[index]["Drug Price"]} Pound",style: TextStyle(color: Colors.indigo,fontSize: 25,fontWeight: FontWeight.w900),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 1,),),
          Container(alignment: Alignment.center,width: 5000,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),color: Colors.indigo,),child: InkWell(onTap: (){},child: Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w900),overflow: TextOverflow.ellipsis,)),)

        ],)),);
      },
      )
    ],),
      ),
    );
  }
}
