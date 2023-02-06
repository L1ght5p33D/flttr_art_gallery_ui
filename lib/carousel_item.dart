import 'package:flutter/material.dart';
import 'package:art_store_ui/as_globals.dart';



class CarouselItem extends StatelessWidget {
   CarouselItem({Key? key,
    required this.art_store_item }) : super(key: key);
    Map art_store_item;



  @override
  Widget build(BuildContext context) {

    return Container(
        height: ss.height * .6,
        width:  ss.width * .6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ss.width*.1)
        ),
        child: Column(
          children: [
            Image.asset(art_store_item["image_path"],
                        fit: BoxFit.cover,
            ),

            Row(children: [
              Column(children: [
                Text(art_store_item["main_title"]),
                Text(art_store_item["short_desc"]),
                ReactionsWidget(users:art_store_item[" reaction_users"])
              ],),

              MaterialButton(onPressed: (){},
                  child:
                  Container(
                    width: ss.width * .18,
                    height: ss.width * .18,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent[100],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(ss.width * .08, ss.width * .03),
                        topRight: Radius.circular(ss.width * .04),
                        bottomLeft: Radius.circular(ss.width * .02),
                        bottomRight: Radius.circular(ss.width * .04),
                         ),
                    ),
                    child:Center(child:Icon(Icons.shopping_basket_outlined))
                  )
              )

            ],)
          ],
        ),
    );
  }
}

class ReactionsWidget extends StatelessWidget {
   ReactionsWidget({Key? key, required this.users}) : super(key: key);

  List users;
  @override
  Widget build(BuildContext context) {

    List<Widget>? positioned_reaction_profile_pics;

    int pic_idx = 0;
    double ruser_pos_inc = ss.width * .03;

    users.forEach((user) {
      if (pic_idx <3){
      positioned_reaction_profile_pics!.add(
        Positioned(
            left: pic_idx * ruser_pos_inc,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(ss.width * .03),
            child:Container(
                width: ss.width * .06,
                child:
                  Image.asset(user_profilepic_data[user],
                              width: ss.width * .06,
                              height: ss.width * .06,
                              fit: BoxFit.contain,
                  )
            )
        ))
      );
      pic_idx +=1;
      }
      if (pic_idx == 3){
        positioned_reaction_profile_pics!.add(
            Positioned(
                left: pic_idx * ruser_pos_inc,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(ss.width * .03),
                    child:Container(
                        width: ss.width * .06,
                        child:
                            Stack(children:[
                        Image.asset(user_profilepic_data[user],
                          width: ss.width * .06,
                          height: ss.width * .06,
                          fit: BoxFit.contain,
                        ),
                          Text("+" + users.length.toString())
                        ])
                    )
                ))
        );
        pic_idx +=1;
      }
    });

    return Container(
      width: ss.width * .35,
      child: Row(children: [
        Stack(children: positioned_reaction_profile_pics!,),
        Text("Reactions")
      ],),
    );
  }
}

