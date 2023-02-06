import 'package:flutter/material.dart';
import 'package:art_store_ui/as_globals.dart';
import 'package:art_store_ui/art_details_page.dart';
import 'package:art_store_ui/reactions_widget.dart';

class CarouselItem extends StatelessWidget {
   CarouselItem({Key? key,
    required this.art_store_item }) : super(key: key);
    Map art_store_item;

  double carousel_item_width = 0.0;

  @override
  Widget build(BuildContext context) {

      carousel_item_width = ss.width*.67;

    return ClipRRect(
        borderRadius: BorderRadius.circular(ss.width * .03),
    child: Container(
        height: carousel_item_width,
        width:  ss.width * .85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ss.width*.1)
        ),
        child: Column(
          children: [
            Flexible(child:
            ClipRRect(
              borderRadius: BorderRadius.circular(ss.width * .03),
              child:
              Image.asset(art_store_item["image_path"],
                        height: ss.height * .4,
                         width:  carousel_item_width,
                        fit: BoxFit.cover,
            ))),
            Container(
                height: ss.height * .2,
                width: carousel_item_width,
                child:
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            Container(
            height: ss.height * .2,
                width: ss.width * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: ss.width * .051,
                      child:
                Text(art_store_item["main_title"],
                      style: TextStyle(fontSize: ss.width *.05,
                                        fontWeight: FontWeight.w600),
                )),
                Container(height: ss.width*.01,),
                Text(art_store_item["short_desc"],
                    style: TextStyle(fontSize: ss.width *.03,
                                      overflow: TextOverflow.ellipsis)),
                ReactionsWidget(users:art_store_item["reaction_users"])
              ],)),

              MaterialButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder:(context) =>
                        ArtDetailsPage(as_item: art_store_item)));
                  },
                  minWidth: ss.width * .16,
                  padding: EdgeInsets.all(0.0),
                  child:
                  Container(
                    width: ss.width * .16,
                    height: ss.width * .16,
                    decoration: BoxDecoration(
                      color:g_accent_color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(ss.width * .08, ss.width * .07),
                        topRight: Radius.circular(ss.width * .025),
                        bottomLeft: Radius.circular(ss.width * .025),
                        bottomRight: Radius.circular(ss.width * .05),
                         ),
                    ),
                    child:Icon(Icons.shopping_basket_outlined,
                                            size:ss.width*.06,
                                            color: Colors.white,
                    )
                  )
              )

            ]),)
          ],
        ),
    ));
  }
}



