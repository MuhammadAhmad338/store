// ignore_for_file: file_names, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/helperServices.dart';
import '../utils/latestShoes.dart';
import '../utils/showModelBottomSheet.dart';

class ProductByCat extends StatefulWidget {
  final List<String> imageUrl;
  final String title;
  final String price;

  const ProductByCat(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl});

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat> with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/top_image.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                      left: 8,
                      right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.go("/");
                          },
                          color: Colors.white,
                          icon: const Icon(Icons.close)),
                      IconButton(
                          onPressed: () {
                            customShowBottomSheet(context);
                          },
                          color: Colors.white,
                          icon: const Icon(Icons.remove))
                    ],
                  ),
                ),
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
                left: 8,
                right: 8),
            child: TabBarView(controller: _tabController, children: [
              FutureBuilder(
                  future: HelperServices.getMaleData(),
                  builder: (context, snapshot) {
                    var maleShoes = snapshot.data;
                    if (!snapshot.hasData) {
                      return Text("Error ${snapshot.error}");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return LatestShoes(
                      sneakers: maleShoes!,
                    );
                  }),
              FutureBuilder(
                  future: HelperServices.getFemaleData(),
                  builder: (context, snapshot) {
                    var femaleShoes = snapshot.data;
                    if (!snapshot.hasData) {
                      return Text("Error ${snapshot.error}");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return LatestShoes(
                      sneakers: femaleShoes!,
                    );
                  }),
              FutureBuilder(
                  future: HelperServices.getKidsData(),
                  builder: (context, snapshot) {
                    var kidsShoes = snapshot.data;
                    if (!snapshot.hasData) {
                      return Text("Error ${snapshot.error}");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    return LatestShoes(
                      sneakers: kidsShoes!,
                    );
                  }),
            ]),
          )
        ]),
      ),
    );
  }
}
