import 'package:flutter/material.dart';


Size ss = Size(0,0);

Color g_accent_color =  Colors.deepPurpleAccent[100]!;
Color g_icon_inactive_color = Colors.black54;

List<Map> art_store_items = [
  {
    "main_title": "Universe",
    "short_desc": "A unique look at just a small piece of our universe. If you let your mind open to the wornders of the natural world, it becomes an entrypoint to becoming something more than you though possible",
    "image_path": "assets/images/universe.png",
    "artist": "Star Gazer",
    "reaction_users": ["user3", "user2", "user5", "user4"],
    "num_arts": "4",
    "pp_path": "assets/images/user2_pp.png",
    "price": "5000"
  },
  {
    "main_title": "Flower Heart",
    "short_desc": "The author of this flower painting took a bouquet and shaped the heart. He decorated the background with beautiful abstraction in purple shades with the addition of gold leaf. All together the elements create a romantic painting that looks elegant and festive and can complement any wall. The author of this flower painting took a bouquet and shaped the heart. He decorated the background with beautiful abstraction in purple shades with the addition of gold leaf. All together the elements create a romantic painting that looks elegant and festive and can complement any wall.",
    "image_path": "assets/images/flowers_heart.png",
    "artist": "NaturesLove",
    "reaction_users": ["user1", "user2", "user3", "user5"],
    "num_arts": "4",
    "pp_path": "assets/images/user3_pp.png",
    "price" : "7700"
  },
  {
    "main_title": "Abstract Purple",
    "short_desc": "Artist Mario Dubsky was born in London, England on 14 May 1939 to German-speaking Viennese parents with both Jewish and Slavic roots, who had converted to Christianity. He entered the Slade School of Fine Art at the age of 17 and was mentored by Dorothy Mead, a mature student who had studied with Bomberg and who passed on what Dubsky referred to as ‘Bombergian precepts’. Dubsky's work in this period included energetic charcoals and thickly painted canvases.",
    "image_path": "assets/images/purple_abstract.png",
    "artist": "MarioDubsky",
    "reaction_users": ["user5", "user4", "user3", "user2"],
    "num_arts": "4",
    "pp_path": "assets/images/user4_pp.png",
    "price": "3500"
  },
  {
    "main_title": "Hands of the Artist's Wife with Bird",
    "short_desc": "Heimann painted portraits, street scenes and many still-lifes often with a sense of heightened realism. Here, the little bird pulling the string taught, seems to be in control, while the much stronger human hand loosely grips the other end. Somehow, human and bird both look comfortable in this scenario.",
    "image_path": "assets/images/hands_bird.png",
    "artist": "Heimann nnamieH",
    "reaction_users": ["user4", "user3", "user2", "user1"],
    "num_arts": "4",
    "pp_path": "assets/images/user5_pp.png",
    "price": "2500"
  }
] ;

Map user_profilepic_data = {
  "user1": "assets/images/user1_pp.png",
  "user2": "assets/images/user2_pp.png",
  "user3": "assets/images/user3_pp.png",
  "user4": "assets/images/user4_pp.png",
  "user5": "assets/images/user5_pp.png",
  "user6": "assets/images/user6_pp.png",
  "user7": "assets/images/user7_pp.png",
  "user8": "assets/images/user8_pp.png",
};