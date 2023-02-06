import 'package:flutter/material.dart';
import 'package:art_store_ui/as_globals.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ArtDetailsPage extends StatefulWidget {
   ArtDetailsPage({Key? key, required this.as_item}) : super(key: key);

  Map as_item;

  @override
  _ArtDetailsPageState createState() => _ArtDetailsPageState();
}

class _ArtDetailsPageState extends State<ArtDetailsPage> {

  // int art_image_chosen_idx = 0;
  PageController page_controller = PageController();

  @override
  Widget build(BuildContext context) {


    return SafeArea(child:Scaffold(body:
    Container(width: ss.width,
              height: ss.height,
    child:Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(
            width:ss.width*.14,
        height: ss.width*.14,
        child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back))),
          Container(
            width:ss.width*.14,
            height: ss.width*.14,
            child:
          IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.star_outline)))
      ],),


          SingleChildScrollView(
              child: Container(
                  // color:Colors.red,
                  height: ss.width,
                width: ss.width,
                child:
                PageView.builder(
                      padEnds: false,
                      controller: page_controller,
                      itemBuilder: (context, index) {
                        return
                        SizedBox(
                            width:ss.width,
                            // color: Colors.green[100 * index],
                            child:Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                    Padding(
                      padding: EdgeInsets.only(left:ss.width*.03),
                        child:FittedBox(
                                    fit: BoxFit.contain,
                                    child:ClipRRect(
                        borderRadius: BorderRadius.circular(ss.width*.1),
                        child: Image.asset(widget.as_item["image_path"],
                                                      width: ss.width * .88,
                                                      height: ss.width * .88,
                                                      fit: BoxFit.fitWidth,
                        ))))]));
                      },
                    )
                )),

      SmoothPageIndicator(
          // activeIndex: art_image_chosen_idx,
          count:  3,
          controller: page_controller,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
                radius:  4.0,
                dotWidth:  5.0,
                dotHeight:  5.0,
                paintStyle:  PaintingStyle.stroke,
                strokeWidth:  1.5,
                dotColor:  g_accent_color,
                activeDotColor:  Colors.deepOrange
          )
        ),
      
      Row(children:[
        Column(children:[
      Container(child:Text(widget.as_item["main_title"])),
        Container(child:Text(widget.as_item["artist"]))
        ]),

        Container(child:Text(  "\$" + widget.as_item["price"]))
      ]),

      Container(child:Text(widget.as_item["short_desc"])),

      Row(children: [
        ClipRRect(borderRadius: BorderRadius.all(Radius.circular(ss.width*.1),),
        child:Image.asset(widget.as_item["pp_path"],
                          width: ss.width*.2,
                          height: ss.width*.2,
                          fit: BoxFit.contain
        )),

        Container(width: ss.width * .66,
                  child:Column(children: [
                    Text(widget.as_item["artist"]),
                    Text(widget.as_item["num_arts"] + " contributions")
                  ],)),

          Container(width: ss.width*.2,
              decoration: BoxDecoration(
                color: g_accent_color
              ),
              child:
                    MaterialButton(
                      onPressed: (){},
                      child:
                      Center(child:
                        Row(children: [
                        Text("Buy Now"),
                        Icon(Icons.arrow_right)
                      ]),
                    )))
                  ])
      ],)
    )));
  }
}
