import 'package:flutter/material.dart';
import 'package:art_store_ui/as_globals.dart';
import 'package:art_store_ui/art_details_page.dart';


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

class ReactionsWidget extends StatelessWidget {
   ReactionsWidget({Key? key, required this.users}) : super(key: key);

  List users;
  @override
  Widget build(BuildContext context) {

    List<Widget> positioned_reaction_profile_pics = [];
    int pic_idx = 0;

    double react_pp_height = ss.width * .1;
    double ruser_pos_inc = react_pp_height * .4;

    users.forEach((user) {
      if (pic_idx <3){
      positioned_reaction_profile_pics.add(
        Positioned(
          top: ss.width*.03,
            left: pic_idx * ruser_pos_inc,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(react_pp_height / 2),
            child:Container(
                width: react_pp_height,
                child:
                  Image.asset(user_profilepic_data[user],
                              width: react_pp_height,
                              height: react_pp_height,
                              fit: BoxFit.cover,
                  )
            )
        ))
      );
      pic_idx +=1;
      }
      if (pic_idx == 3){
        positioned_reaction_profile_pics.add(
            Positioned(
                top: ss.width*.03,
                left: pic_idx * ruser_pos_inc,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(react_pp_height / 2),
                    child:Container(
                        width: react_pp_height,
                        height: react_pp_height,
                        child:
                            Stack(children:[
                        Image.asset(user_profilepic_data[user],
                          width: react_pp_height,
                          height: react_pp_height,
                          fit: BoxFit.cover,
                        ),
                          Positioned(
                              top: react_pp_height * .3,
                              left: react_pp_height * .3 ,
                              child:Text("+" + users.length.toString(),
                                style: TextStyle(color: Colors.white,
                                                  fontSize: react_pp_height * .3,
                                                  fontWeight: FontWeight.w600),))
                        ])
                    )
                ))
        );
        pic_idx +=1;
      }
    });

    return Container(
      width: ss.width * .5,
      height: ss.width * .2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
      Container(
      width: ss.width * .2,
        height: ss.width * .2,
        child:
        Stack(children: positioned_reaction_profile_pics,)),
      Padding(
        padding: EdgeInsets.only(bottom: react_pp_height * .5)
          ,child:Text("Reactions",
                    style: TextStyle(fontSize: ss.width*.03)))
      ],),
    );
  }
}

