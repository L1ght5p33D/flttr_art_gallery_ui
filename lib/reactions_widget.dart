import 'package:flutter/material.dart';
import 'package:art_store_ui/as_globals.dart';

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
      else if (pic_idx == 3){
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
      }else {
        pic_idx += 1;
      }
    });

      double reactions_width;
      reactions_width = react_pp_height +  users.length * ruser_pos_inc ;
      if (users.length >3){
        reactions_width = ss.width*.24;
      }
    return Container(
      width: ss.width * .5,
      height: ss.width * .2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: reactions_width,
              height: ss.width * .2,
              child:
              Stack(children: positioned_reaction_profile_pics,)),

      Padding(
          padding: EdgeInsets.only(bottom: react_pp_height * .3,)
          ,child:Icon(Icons.read_more,
                  size: ss.width*.044,))
          // Padding(
          //     padding: EdgeInsets.only(bottom: react_pp_height * .3,)
          //     ,child:Text("view reactions",
          //     style: TextStyle(fontSize: ss.width*.025)))
        ],),
    );
  }
}