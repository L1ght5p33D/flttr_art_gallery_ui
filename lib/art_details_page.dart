import 'package:flutter/material.dart';
import 'package:art_store_ui/as_globals.dart';

class ArtDetailsPage extends StatefulWidget {
  const ArtDetailsPage({Key? key}) : super(key: key);

  @override
  _ArtDetailsPageState createState() => _ArtDetailsPageState();
}

class _ArtDetailsPageState extends State<ArtDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Container(width: ss.width,
              height: ss.height,
    child:Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
        IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.star_outline))
      ],),
      
    ],)));
  }
}
