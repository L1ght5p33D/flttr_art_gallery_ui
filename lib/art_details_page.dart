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

  int art_image_chosen_idx = 0;
  PageController page_controller = PageController(viewportFraction: 0.8, keepPage: true);
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

        Container(
          width:ss.width,
          height: ss.width * 1.2,
          child:
    //   ListView.builder(
    //   scrollDirection: Axis.horizontal,
    // controller: _scroll_controller,
    // itemCount: 3,
    // itemBuilder: (context, art_img_idx){
    //
    //    return
    //      GestureDetector(
    //          onTap: (){
    //            setState(() {
    //              art_image_chosen_idx = art_img_idx;
    //            });
    //          },
    //          child:Padding(padding: EdgeInsets.all(ss.width*.04),
    //           child: Image.asset(widget.as_item["image_path"],
    //                               width: ss.width*.96,
    //                               height: ss.height* .69,
    //                               fit: BoxFit.cover,
    //           )));
    //
    //   })),
          SingleChildScrollView(
            reverse: true,
                  child: SizedBox(
                    height: ss.width*.96,
                    child: PageView.builder(
                      controller: page_controller,
                      // itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return
                             GestureDetector(
                                 onTap: (){
                                   setState(() {
                                     art_image_chosen_idx = index;
                                   });
                                 },
                                 child:Padding(padding: EdgeInsets.all(ss.width*.04),
                                  child: Image.asset(widget.as_item["image_path"],
                                                      width: ss.width*.96,
                                                      height: ss.width*.96,
                                                      fit: BoxFit.cover,
                                  )));
                      },
                    ),
                  ))),

      SmoothPageIndicator(
          // activeIndex: art_image_chosen_idx,
          count:  3,
          controller: page_controller,
          axisDirection: Axis.horizontal,
          effect:  SlideEffect(
              spacing:  ss.width*.02,
              radius:  4.0,
              dotWidth:  5.0,
              dotHeight:  5.0,
              paintStyle:  PaintingStyle.stroke,
              strokeWidth:  1.5,
              dotColor:  Colors.transparent,
              activeDotColor:  Colors.deepOrange
          ),
        )

    ],))));
  }
}
