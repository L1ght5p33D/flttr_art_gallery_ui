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
                          Container(
                              width:ss.width*.14,
                              height: ss.width*.14,
                              child:
                          IconButton(
                              onPressed: () {
                                print("menu press");
                              },
                              icon: Icon(Icons.menu,
                                          color: g_icon_inactive_color,))),
            Container(
                width:ss.width*.14,
                height: ss.width*.14,
                child:
                          IconButton(
                              onPressed: () {
                                print("menu press");
                              },
                              icon: Icon(Icons.shopping_basket_outlined,
                                          color: g_icon_inactive_color)))
                        ],
                      )),

                      Text(
                        "View our amazing collection!",
                        style: TextStyle(fontSize: ss.width * .07),
                      ),
                      Padding(padding: EdgeInsets.all(ss.width*.01)),
                      Text(
                          "Our art is sourced from creators all over the world. We have different styles for everyone",
                          style: TextStyle(
                              fontSize: ss.width * .036,
                              fontWeight: FontWeight.w300)),
                      Padding(padding: EdgeInsets.all(ss.width*.02)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding:EdgeInsets.only(bottom:ss.width*.02),
                            child:
                          Text(
                            "Popular",
                            style: TextStyle(fontSize: ss.width * .05,
                                              fontWeight: FontWeight.w500),
                          )),
                         const Text(
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
                          height: ss.height * .59,
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
                            gap: 2,
                            activeColor: Colors.white,
                            iconSize: 24,
                            textStyle: TextStyle(fontSize: 12,
                                                color: Colors.white
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 9),
                            duration: const Duration(milliseconds: 400),
                            tabBackgroundColor: g_accent_color,
                            color: g_icon_inactive_color,
                            tabs: const [
                              GButton(
                                icon: LineIcons.home,
                                gap:7,
                                text: 'Home',
                              ),
                              GButton(
                                icon: LineIcons.star,
                                gap:7,
                                text: 'Favorites',
                              ),
                               GButton(
                                icon: Icons.notifications_none,
                                 gap:7,
                                 text: 'Notifications',
                              ),
                               GButton(
                                icon: LineIcons.user,
                                 gap:7,
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
