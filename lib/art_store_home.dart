import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:art_store_ui/as_globals.dart';
import 'package:art_store_ui/carousel_item.dart';

class ArtStoreHome extends StatefulWidget {
  const ArtStoreHome({Key? key}) : super(key: key);

  @override
  _ArtStoreHomeState createState() => _ArtStoreHomeState();
}

class _ArtStoreHomeState extends State<ArtStoreHome> {

  // CarouselController buttonCarouselController = CarouselController();
  List<Widget> carousel_items = [
    CarouselItem(art_item_1),
    CarouselItem(art_item_2),
    CarouselItem(art_item_3),
    CarouselItem(art_item_4)
  ];
  @override
  Widget build(BuildContext context) {
    ss = MediaQuery.of(context).size;
    return SafeArea(child:
    Scaffold(body:
     Container(
     height: double.infinity,
     width: double.infinity,
     child:Column(children: [
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           IconButton(onPressed: (){print("menu press");},
               icon: Icon(Icons.menu)),

           IconButton(onPressed: (){print("menu press");},
               icon: Icon(Icons.shopping_basket_outlined))
         ],),
        Text("View our amazing collection!"),
        Text("Our art is sourced from creators all over the world. We have different style for everyone"),

       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
         Text("Popular",
              style:TextStyle(fontSize: 26.0)
         ),

         Text("See all",
              style: TextStyle(
                fontSize: 12.0,
                  decoration: TextDecoration.underline),
         )
       ],),

       CarouselSlider(
         items: carousel_items,
         // carouselController: buttonCarouselController,
         options: CarouselOptions(
           autoPlay: false,
           enlargeCenterPage: true,
           viewportFraction: 0.9,
           aspectRatio: 2.0,
           initialPage: 2,
         ),
       )

     ],)
    )));
  }
}


