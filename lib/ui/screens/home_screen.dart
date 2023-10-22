import 'package:feeds/constants/route_names.dart';
import 'package:feeds/ui/helper/custom_widgets.dart';
import 'package:feeds/ui/helper/feed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double height;
  late double width;

  @override
  void didChangeDependencies() {
    height =
        MediaQuery.sizeOf(context).height - MediaQuery.paddingOf(context).top;
    width = MediaQuery.sizeOf(context).width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: width,
        backgroundColor: Colors.deepPurpleAccent,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Center(
                  child:
                      getText(data: 'Logo', color: Colors.white, fontSize: 20),
                ),
                Positioned(
                    right: 10,
                    child: Builder(builder: (context) {
                      return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).closeDrawer();
                          },
                          child: const Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ));
                    })),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child:
                    Builder(
                      builder: (context) {
                        return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).closeDrawer();
                            },
                            child: getText(data: 'Home', color: Colors.white, fontSize: 14));
                      }
                    )),
            const SizedBox(
              height: 15,
            ),
            Center(
                child:
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, feedScreen);
                      },
                        child: getText(data: 'Feed', color: Colors.white, fontSize: 14))),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/home_top_bg.png",
                    height: height * 0.25,
                    fit: BoxFit.fill,
                    width: width,
                  ),
                  Positioned(
                      top: 10,
                      child: Container(
                        width: width,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Builder(
                                  builder: (context) {
                                    return GestureDetector(
                                        onTap: () {
                                          Scaffold.of(context).openDrawer();
                                        },
                                        child: Icon(
                                          Icons.menu,
                                          color: Colors.white,
                                        ));
                                  },
                                ),
                                getText(
                                    data: 'Logo',
                                    color: Colors.white,
                                    fontSize: 20),
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.07,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: getText(
                                  data: 'Upcoming Events',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            getElevatedContainer(
                                width: width,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      getText(
                                          data:
                                              'Session: Ice breaking activity',
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.deepPurpleAccent,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        getText(
                                          data: '5 Jan',
                                          fontSize: 12,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        getText(
                                          data: ' | 10 pm- 12 pm',
                                          fontSize: 12,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                      ])
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                ],
              ),
              CarouselSlider(
                  items: [
                    "assets/images/banner1.png",
                    "assets/images/banner2.png",
                  ]
                      .map((e) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(e),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    height: height * 0.2,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlay: true,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getText(
                        data: 'Featured Speakers',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 5,
                    ),
                    getElevatedContainer(
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    "assets/images/speaker.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                  getText(
                                    data: 'Alisha Shekhar',
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  getText(
                                    data: 'Yoga Expert',
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getText(
                                      data: 'Session: Ice breaking activity',
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.deepPurpleAccent,
                                      size: 15,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    getText(
                                      data: '5 Jan',
                                      fontSize: 12,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    getText(
                                      data: ' | 10 pm- 12 pm',
                                      fontSize: 12,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ])
                                ],
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    getText(
                        data: 'What\'s happening around you!',
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    ListView.builder(
                      itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                      return   FeedItem(
                          assetPath: "assets/images/speaker.png",
                          postPath: "assets/images/post1.png",
                          name: 'Sumit Kushwaha',
                          time: '3 hours',
                          caption: 'Plantation activity made fun',
                          numLikes: 70,
                          numComments: 69);
                    })

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
