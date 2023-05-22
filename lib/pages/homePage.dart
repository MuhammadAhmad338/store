// ignore_for_file: file_names, unused_local_variable, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore/services/helperServices.dart';
import 'package:mystore/services/themeServices.dart';
import 'package:mystore/utils/mainText.dart';
import 'package:mystore/utils/productCard.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(vsync: this, length: 3);

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeService>(context);
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/top_image.png"),
                  fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Animate(
                effects: const [
                  FadeEffect(),
                  SlideEffect(),
                  ShakeEffect(hz: 2)
                ],
                child: MainText(
                  text: "Athletic Clothes",
                ),
              ),
              Animate(
                  effects: const [
                    FadeEffect(),
                    SlideEffect(),
                    ShakeEffect(hz: 2)
                  ],
                  child: MainText(
                    text: "Shoes",
                  )),
              TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelColor: Colors.white,
                  tabs: const [
                    Tab(text: "Men Shoes"),
                    Tab(text: "Women Shoes"),
                    Tab(text: "Kids Shoes")
                  ]),
            ]),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.285),
          child: Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.02),
            child: TabBarView(controller: _tabController, children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.405,
                    child: FutureBuilder(
                        future: HelperServices.getMaleData(),
                        builder: (context, snapshot) {
                          var maleShoes = snapshot.data;
                          if (!snapshot.hasData) {
                            return Text("Error ${snapshot.error}");
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          return ListView.builder(
                              itemCount: maleShoes!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var maleShoe = maleShoes[index];
                                var image = maleShoe.imageUrl[0];
                                return GestureDetector(
                                    onTap: () {
                                      var title = maleShoe.title;
                                      var price = maleShoe.price;
                                      context.go(Uri(
                                          path: "/productByCat",
                                          queryParameters: {
                                            'title': title,
                                            'price': price,
                                            'imageUrl': image
                                          }).toString());
                                    },
                                    child: ProductCard(
                                      sneaker: maleShoe,
                                      imageUrl: image,
                                    ));
                              });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Latest Shoes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Show All",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              );
                            })),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.405,
                    child: FutureBuilder(
                        future: HelperServices.getFemaleData(),
                        builder: (context, snapshot) {
                          var femaleShoes = snapshot.data;
                          if (!snapshot.hasData) {
                            return Text("Error ${snapshot.error}");
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          return ListView.builder(
                              itemCount: femaleShoes!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var femaleShoe = femaleShoes[index];
                                var image = femaleShoe.imageUrl[0];
                                return GestureDetector(
                                    onTap: () {
                                      var title = femaleShoe.title;
                                      var price = femaleShoe.price;
                                      context.go(Uri(
                                          path: "/productByCat",
                                          queryParameters: {
                                            'title': title,
                                            'price': price,
                                            'imageUrl': '${femaleShoe.imageUrl}'
                                          }).toString());
                                    },
                                    child: ProductCard(
                                        sneaker: femaleShoe, imageUrl: image));
                              });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Latest Shoes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Show All",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  width:
                                      MediaQuery.of(context).size.width * 0.28,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              );
                            })),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.405,
                    child: FutureBuilder(
                        future: HelperServices.getKidsData(),
                        builder: (context, snapshot) {
                          var kidsShoes = snapshot.data;

                          if (!snapshot.hasData) {
                            return Text("Error ${snapshot.error}");
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }

                          return ListView.builder(
                              itemCount: kidsShoes!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var kidShoe = kidsShoes[index];
                                var image = kidShoe.imageUrl[0];
                                return GestureDetector(
                                    onTap: () {
                                      var title = kidShoe.title;
                                      var price = kidShoe.price;
                                      context.go(Uri(
                                          path: "/productByCat",
                                          queryParameters: {
                                            'title': title,
                                            'price': price,
                                            'imageUrl': image
                                          }).toString());
                                    },
                                    child: ProductCard(
                                        sneaker: kidShoe, imageUrl: image));
                              });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Latest Shoes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Show All",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.28,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 0.8,
                                              spreadRadius: 1,
                                              color: Colors.black38,
                                              offset: Offset(0, 1))
                                        ],
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Image.network(
                                        "https://d326fntlu7tb1e.cloudfront.net/uploads/58282ea3-b815-4d26-9f4f-382aa62f67cf-HP5404_a1.webp")),
                              );
                            })),
                  )
                ],
              ),
            ]),
          ),
        ),
      ]),
    ));
  }
}
