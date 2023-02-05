import 'package:flutter/material.dart';
import 'package:art_store_ui/as_globals.dart';



class CarouselItem extends StatelessWidget {
   CarouselItem({Key? key,
    this.image_path:"",
     this.main_title: "",
    this.short_desc: "",
      required this.reaction_users  }) : super(key: key);

   String image_path;
  String main_title;
  String short_desc;
  List reaction_users;

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
            Image.asset(image_path,
                        fit: BoxFit.cover,
            ),

            Row(children: [
              Column(children: [
                Text(main_title),
                Text(short_desc),
                ReactionsWidget(users: reaction_users)
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
