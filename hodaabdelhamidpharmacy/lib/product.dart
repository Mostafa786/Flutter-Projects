import 'package:flutter/material.dart';
import 'package:hodaabdelhamidpharmacy/shop.dart';

class ProductPage extends StatefulWidget {
  final String CategoryIn;
  const ProductPage({super.key,required this.CategoryIn});

  @override
  State<ProductPage> createState() => _ProductPageState();
}
class _ProductPageState extends State<ProductPage> {
  List Product = [
    {
      "Image":"images/Cipro.png",
      "Drug Name":"Cipro 500mg 10 Tablets",
      "Drug CategoryIn":"Anti-Biotics & Other",
      "Favorite":false,
      "Best Seller" : false,
      "Special Offer" : "25% Discount",
      "Drug Price":149
    },
    {
      "Image":"images/Neozolid.png",
      "Drug Name":"Neozolid 600mg 3 Tablet",
      "Drug CategoryIn":"Anti-Biotics & Other",
      "Favorite":false,
      "Best Seller" : false,
      "Special Offer" : "50% Discount"
      ,"Drug Price":199
    },
    {
      "Image":"images/Levoxin.png",
      "Drug Name":"Levoxin 500mg 5 Tablets",
      "Drug CategoryIn":"Anti-Biotics & Other",
      "Favorite":false,
      "Best Seller" : false,
      "Special Offer" : ""
      ,"Drug Price":99
    },
    {
      "Image":"images/Respenzo.png",
      "Drug Name":"Respenzo 600mg 10 Tablets",
      "Drug CategoryIn":"Anti-Biotics & Other",
      "Favorite":false,
      "Best Seller" : false,
      "Special Offer" : ""
      ,"Drug Price":299
    },
  ];
  List productDisplay = [];
  BestSell_Function_detect(){
    for(int i = 0;i<Product.length;i++){
      if(Product[i]["Drug CategoryIn"] == widget.CategoryIn){
        productDisplay.addAll([Product[i]]);
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
    return Scaffold(appBar: AppBar(toolbarHeight: 80,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),backgroundColor: Colors.indigo,centerTitle: true,title: Image.asset(height: 75,"images/Logo-Photoroom2.png"),actions: [InkWell(onTap: (){},child: Container(margin: EdgeInsets.only(top: 8,right: 15),child: Icon(Icons.shopping_cart_rounded,size: 30,)),)],),
        body: Container(padding: EdgeInsets.all(10),
            child: productDisplay.length > 0?ListView(physics: BouncingScrollPhysics(),
              children: [
                Container(margin: EdgeInsets.only(left: 10),child: Text("${widget.CategoryIn} (${productDisplay.length})",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,fontFamily: "Times New Roman"),textAlign: TextAlign.left,)),
                Container(child:GridView.builder(itemCount: productDisplay.length,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 450),itemBuilder: (context, index) {
                  return Container(child: Card(child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 250,
                        child: Stack(
                          children: [
                            Image.asset(productDisplay[index]["Image"],height: 300,),
                            if(productDisplay[index]["Best Seller"])Positioned(right: 0,top: 0,child:Container(margin: EdgeInsets.only(right: 5,top: 5),padding: EdgeInsets.all(7),decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(30)),child: Text("Best Seller",style: TextStyle(color: Colors.white),),)),
                            if(productDisplay[index]["Special Offer"] != "")Positioned(right: 0,bottom: 0,child:Container(padding: EdgeInsets.only(top:5,left: 5),width: 110,decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),color: Colors.redAccent,backgroundBlendMode: BlendMode.hardLight),child: Text(productDisplay[index]["Special Offer"],maxLines: 2,overflow: TextOverflow.ellipsis),)),
                            Positioned(left: 0,top: 0,child:Container(margin: EdgeInsets.only(left: 10,top: 10),child:InkWell(onTap: (){setState(() {
                              productDisplay[index]["Favorite"] = !productDisplay[index]["Favorite"];
                            });},child:productDisplay[index]["Favorite"]?Icon(Icons.favorite_rounded,color: Colors.red,):Icon(Icons.favorite_border_rounded)))),
                          ],),
                      ),
                      Container(margin: EdgeInsets.only(left: 5),alignment: Alignment.centerLeft,child: Text("${productDisplay[index]["Drug Name"]}",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 2,)),
                      Container(margin: EdgeInsets.only(left: 5),alignment: Alignment.centerLeft,child: Text("${productDisplay[index]["Drug CategoryIn"]}",style: TextStyle(color: Colors.grey),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 1,),),
                      Container(margin: EdgeInsets.only(left: 5),alignment: Alignment.centerLeft,child: Text("${productDisplay[index]["Drug Price"]} Pound",style: TextStyle(color: Colors.indigo,fontSize: 25,fontWeight: FontWeight.w900),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,maxLines: 1,),),
                      Container(alignment: Alignment.center,width: 5000,height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),color: Colors.indigo,),child: InkWell(onTap: (){},child: Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w900),overflow: TextOverflow.ellipsis,)),)

                    ],)),);
                },
                ))
              ],
            ):Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
              Container(margin: EdgeInsets.only(left: 10),alignment: Alignment.centerLeft,child: Text("Best Sell",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,fontFamily: "Times New Roman"),textAlign: TextAlign.left,)),
              Container(child: Image.asset(fit: BoxFit.cover,"images/danger.png",color: Colors.indigo,)),
              Container(margin: EdgeInsets.only(left: 10),child: Text("No Best Sell yet",overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),)),
              Container(margin: EdgeInsets.symmetric(horizontal: 10),child: MaterialButton(padding: EdgeInsets.all(15),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),color: Colors.indigo,onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShopPage()));
              },minWidth: 50000,child: Text("Shop By Category",overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),),))
            ])
        ));
  }
}
