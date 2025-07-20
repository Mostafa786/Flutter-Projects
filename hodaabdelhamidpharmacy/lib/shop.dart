import 'package:flutter/material.dart';
import 'package:hodaabdelhamidpharmacy/category.dart';

import 'favorite.dart';
import 'homepage.dart';
import 'more.dart';
import 'offers.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List Category = [
    {
      "Category Name":"Medications",
      "Category Image":"images/Medicine.png"
    },
    {
      "Category Name":"Baby & Mum",
      "Category Image":"images/Baby & Mum.png"
    },
    {
      "Category Name":"Diet & Fitness",
      "Category Image":"images/Diet & Fitness.png"
    },
    {
      "Category Name":"Skin Care",
      "Category Image":"images/Skin Care.png"
    },
    {
      "Category Name":"Child Health",
      "Category Image":"images/Child Health.png"
    },
    {
      "Category Name":"Hair Care",
      "Category Image":"images/Hair Care.png"
    },
    {
      "Category Name":"Cosmetics",
      "Category Image":"images/Cosmetics.png"
    },
    {
      "Category Name":"Sexual Health",
      "Category Image":"images/Sexual Health.png"
    },
    {
      "Category Name":"Vitamins & Supplements",
      "Category Image":"images/Vitamins & Supplements.png"
    },
    {
      "Category Name":"Daily Essentials",
      "Category Image":"images/Daily Essentials.png"
    },
    {
      "Category Name":"Home Health Care",
      "Category Image":"images/Home Health Care.png"
    },
    {
      "Category Name":"veterinary",
      "Category Image":"images/vet.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavigationBar(iconSize:28,type: BottomNavigationBarType.fixed,currentIndex:1,onTap: (val){setState(() {
      if(val == 0){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()),(route) => false);
      }
      else if(val == 1){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ShopPage()));
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
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.home_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Home",style: TextStyle(color: Colors.white),))],)),label: "Home"),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),decoration:BoxDecoration(color: Colors.indigo[600],borderRadius: BorderRadius.circular(10)),child: Column(children: [Icon(Icons.shopping_bag_rounded,color: Colors.white,), Container(margin: EdgeInsets.only(top: 3),child: Text("Shop",style: TextStyle(color: Colors.white),))],)),label: "Shop"),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.favorite_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Favorite",style: TextStyle(color: Colors.white),))],)),label: "Favorite"),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.percent_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("Offers",style: TextStyle(color: Colors.white),))],)),label: "Offers"),
          BottomNavigationBarItem(icon: Container(padding: EdgeInsets.symmetric(vertical: 7,horizontal: 13),child: Column(children: [Icon(Icons.more_horiz_rounded,color: Colors.white,),Container(margin: EdgeInsets.only(top: 3),child: Text("More",style: TextStyle(color: Colors.white),))],)),label: "More")
        ]),appBar: AppBar(toolbarHeight: 80,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),backgroundColor: Colors.indigo,centerTitle: true,title: Image.asset(height: 75,"images/Logo-Photoroom2.png"),actions: [InkWell(onTap: (){},child: Container(margin: EdgeInsets.only(top: 8,right: 15),child: Icon(Icons.shopping_cart_rounded,size: 30,)),)],),
      body: Container(margin: EdgeInsets.only(top: 10),padding: EdgeInsets.all(10),child: ListView(physics: BouncingScrollPhysics(),
        children: [
          GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: Category.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 180),itemBuilder: (context, index) {
            return Column(
              children: [
                Container(height: 110,padding: EdgeInsets.all(15),decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey[300]),
                  child:InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Categorypage(category: Category[index]["Category Name"])));},child: Image.asset(Category[index]["Category Image"])),),
                Text("${Category[index]["Category Name"]}",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2)
              ],
            );
          },),
        ],
      ),),
    );
  }
}
