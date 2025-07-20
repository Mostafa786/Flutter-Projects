import 'package:flutter/material.dart';
import 'package:hodaabdelhamidpharmacy/product.dart';

class Categorypage extends StatefulWidget {
  final String category;
  const Categorypage({super.key,required this.category});

  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {
  List Categorices = [
    {
      "Category":"Medications",
      "CategoryIn":"Anti-Biotics & Other"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Pain,Fever & Inflammation"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Smoking Cessation"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Heart,Blood & Hypertension"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Hemorrhoids & Varicose"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Hormones"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Anti Asthma"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Women's Health"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Diabetes Mellitus"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Urinary Tract Diseases"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Digestive Health"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Sleep Enhancer"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Oral Health"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Bone Diseases"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Ear Health"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Anti Allergy"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Neurological Diseases"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Skin Health"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Cough & Cold"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Immune System"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Eye Health Care"
    },
    {
      "Category":"Medications",
      "CategoryIn":"Vaccines"
    },
    {
      "Category":"Baby & Mum",
      "CategoryIn":"Baby Food"
    },
    {
      "Category":"Baby & Mum",
      "CategoryIn":"Baby Milk"
    },
    {
      "Category":"Baby & Mum",
      "CategoryIn":"Diapers"
    },
    {
      "Category":"Baby & Mum",
      "CategoryIn":"Baby & Kids Toiletries"
    },
    {
      "Category":"Baby & Mum",
      "CategoryIn":"Baby Accessories"
    },
    {
      "Category":"Baby & Mum",
      "CategoryIn":"Mother Care"
    },
    {
      "Category":"Diet & Fitness",
      "CategoryIn":"Weight Loss"
    },
    {
      "Category":"Diet & Fitness",
      "CategoryIn":"Herbal Drinks"
    },
    {
      "Category":"Diet & Fitness",
      "CategoryIn":"Artificial Sweetener"
    },
    {
      "Category":"Diet & Fitness",
      "CategoryIn":"Sport Supplements"
    },
    {
      "Category":"Skin Care",
      "CategoryIn":"Body Care"
    },
    {
      "Category":"Skin Care",
      "CategoryIn":"Face CAre"
    },
    {
      "Category":"Skin Care",
      "CategoryIn":"Foot & Hand Care"
    },
    {
      "Category":"Skin Care",
      "CategoryIn":"Sun Care"
    },
    {
      "Category":"Skin Care",
      "CategoryIn":"Anti-Ageing"
    },
    {
      "Category":"Skin Care",
      "CategoryIn":"Whitening"
    },
    {
      "Category":"Child Health",
      "CategoryIn":"Children Allergy & Asthma"
    },{
      "Category":"Child Health",
      "CategoryIn":"Children Anti-Biotics & Other"
    },
    {
      "Category":"Child Health",
      "CategoryIn":"Children Digestive Health"
    },{
      "Category":"Child Health",
      "CategoryIn":"Children Pain & Fever"
    },
    {
      "Category":"Child Health",
      "CategoryIn":"Children Supplements"
    },{
      "Category":"Child Health",
      "CategoryIn":"Children Neurological Diseases"
    },
    {
      "Category":"Child Health",
      "CategoryIn":"Children Cough,Cold & Flu"
    },{
      "Category":"Hair Care",
      "CategoryIn":"Hair Coloring"
    },
    {
      "Category":"Hair Care",
      "CategoryIn":"Conditioners & Masks"
    },{
      "Category":"Hair Care",
      "CategoryIn":"Shampoo"
    },
    {
      "Category":"Hair Care",
      "CategoryIn":"Styling"
    },{
      "Category":"Hair Care",
      "CategoryIn":"Hair & Scalp Treatments"
    },
    {
      "Category":"Cosmetics",
      "CategoryIn":"Contact Lenses"
    },{
      "Category":"Cosmetics",
      "CategoryIn":"Beauty Accessories"
    },
    {
      "Category":"Cosmetics",
      "CategoryIn":"Make-Up"
    },{
      "Category":"Cosmetics",
      "CategoryIn":"Nails"
    },
    {
      "Category":"Cosmetics",
      "CategoryIn":"Fragrance"
    },{
      "Category":"Cosmetics",
      "CategoryIn":"Eye Lashes Accessories"
    },
    {
      "Category":"Sexual Health",
      "CategoryIn":"Condoms"
    },{
      "Category":"Sexual Health",
      "CategoryIn":"Erectile Dysfunction"
    },
    {
      "Category":"Sexual Health",
      "CategoryIn":"Moisturizers & Lubricants"
    },{
      "Category":"Sexual Health",
      "CategoryIn":"Sexual Tonics"
    },
    {
      "Category":"Sexual Health",
      "CategoryIn":"Premature Ejaculation"
    },{
      "Category":"Sexual Health",
      "CategoryIn":"Contraceptives"
    },
    {
      "Category":"Vitamins & Supplements",
      "CategoryIn":"Omega & Extracts"
    },{
      "Category":"Vitamins & Supplements",
      "CategoryIn":"Health Purpose"
    },{
      "Category":"Vitamins & Supplements",
      "CategoryIn":"Vitamin A Z"
    },{
      "Category":"Vitamins & Supplements",
      "CategoryIn":"Minerals"
    },
    {
      "Category":"Daily Essentials",
      "CategoryIn":"Feminine Care"
    },
    {
      "Category":"Daily Essentials",
      "CategoryIn":"Elderly Care"
    },
    {
      "Category":"Daily Essentials",
      "CategoryIn":"Oral Care"
    },
    {
      "Category":"Daily Essentials",
      "CategoryIn":"Men Care"
    },
    {
      "Category":"Daily Essentials",
      "CategoryIn":"Body Fresheners"
    },
    {
      "Category":"Daily Essentials",
      "CategoryIn":"Bath & Body"
    },
    {
      "Category":"Daily Essentials",
      "CategoryIn":"Home Care & Hygienics"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Diabetes Care"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Comfort & Relaxation"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"First Aid & Disposables"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Brace & Support"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Face Mask & Shield"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Toilet Aid"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Nebulizers & Accessories"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Thermometers"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Blood Pressure Monitor"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Compression & Hosier"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Fitness & Slimming"
    },
    {
      "Category":"Home Health Care",
      "CategoryIn":"Wheel Chairs & Crutches"
    },{
      "Category":"Home Health Care",
      "CategoryIn":"Pulse Oximeters"
    },
    {
      "Category":"veterinary",
      "CategoryIn":"Medicine"
    },
    {
      "Category":"veterinary",
      "CategoryIn":"Animal Dry Food"
    },
    {
      "Category":"veterinary",
      "CategoryIn":"Shampoo For Pets"
    },
    {
      "Category":"veterinary",
      "CategoryIn":"Accessories"
    },
  ];
  List categoryShow = [];
  catDisplay() {
    for (int i = 0; i < Categorices.length; i++) {
      if (widget.category == Categorices[i]["Category"]){
        categoryShow.addAll([Categorices[i]["CategoryIn"]]);
      }
    }
  }
  @override
  void initState() {
    catDisplay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(toolbarHeight: 80,shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))),backgroundColor: Colors.indigo,centerTitle: true,title: Image.asset(height: 75,"images/Logo-Photoroom2.png"),actions: [InkWell(onTap: (){},child: Container(margin: EdgeInsets.only(top: 8,right: 15),child: Icon(Icons.shopping_cart_rounded,size: 30,)),)],),
      body: Container(padding: EdgeInsets.all(10),child: GridView.builder(physics: BouncingScrollPhysics(),itemCount:categoryShow.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 80,crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5),itemBuilder: (context, index) {
        return InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductPage(CategoryIn: categoryShow[index])));},child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.indigo,),alignment: Alignment.center,child: Text(categoryShow[index],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 25),overflow: TextOverflow.ellipsis,maxLines: 2,)),);
      },)),
    );
  }
}
