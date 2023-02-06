import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:art_store_ui/as_globals.dart';
import 'package:art_store_ui/carousel_item.dart';
import 'package:line_icons/line_icons.dart';

class ArtStoreHome extends StatefulWidget {
  const ArtStoreHome({Key? key}) : super(key: key);

  @override
  _ArtStoreHomeState createState() => _ArtStoreHomeState();
}

class _ArtStoreHomeState extends State<ArtStoreHome> {
  // CarouselController buttonCarouselController = CarouselController();
  List<Widget> carousel_items = [
    CarouselItem(
      art_store_item: art_store_items[0],
    ),
    CarouselItem(
      art_store_item: art_store_items[1],
    ),
    CarouselItem(
      art_store_item: art_store_items[2],
    ),
    CarouselItem(
      art_store_item: art_store_items[3],
    )
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ss = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                    padding: EdgeInsets.all(ss.width * .02),
                    child: Column(children: [
                      Flexible(child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                print("menu press");
                              },
                              icon: Icon(Icons.menu)),
                          IconButton(
                              onPressed: () {
                                print("menu press");
                              },
                              icon: Icon(Icons.shopping_basket_outlined))
                        ],
                      )),
                      Padding(padding: EdgeInsets.all(ss.width*.06)),
                      Text(
                        "View our amazing collection!",
                        style: TextStyle(fontSize: ss.width * .07),
                      ),
                      Text(
                          "Our art is sourced from creators all over the world. We have different style for everyone",
                          style: TextStyle(
                              fontSize: ss.width * .036,
                              fontWeight: FontWeight.w300)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular",
                            style: TextStyle(fontSize: ss.width * .06),
                          ),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 12.0,
                                decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                      CarouselSlider(
                        items: carousel_items,
                        // carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          enlargeFactor: .3,
                          padEnds: false,
                          viewportFraction: 0.69,
                          // aspectRatio: .5,
                          height: ss.height * .63,
                          initialPage: 1,
                        ),
                      ),
                    ]))),
            bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withOpacity(.1),
                    )
                  ],
                ),
                child: SafeArea(
                    child:
                      GNav(
                            rippleColor: Colors.grey[300]!,
                            hoverColor: Colors.grey[100]!,
                            gap: 8,
                            activeColor: Colors.black,
                            iconSize: 24,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            duration: Duration(milliseconds: 400),
                            tabBackgroundColor: g_accent_color,
                            color: Colors.black,
                            tabs: [
                              GButton(
                                icon: LineIcons.home,
                                text: 'Home',
                              ),
                              GButton(
                                icon: LineIcons.heart,
                                text: 'Likes',
                              ),
                              GButton(
                                icon: LineIcons.search,
                                text: 'Search',
                              ),
                              GButton(
                                icon: LineIcons.user,
                                text: 'Profile',
                              ),
                            ],
                            selectedIndex: _selectedIndex,
                            onTabChange: (index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                            })))));
  }
}
