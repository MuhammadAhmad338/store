// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/androidenterprise/v1.dart';
import 'package:mystore/pages/productPage.dart';
import 'package:provider/provider.dart';
import '../services/helperServices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var helperProvider = Provider.of<HelperServices>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: helperProvider.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var buds = snapshot.data!.where((product) => product.category == "buds").toList();
                var trimmers = snapshot.data!.where((product) => product.category == "trimmer").toList();

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.06,
                            bottom: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Home",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.15)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, top: 8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Image.asset(
                                  "assets/images/inviteFriend.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.06,
                            right: MediaQuery.of(context).size.width * 0.06),
                        child: Card(
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0)),
                            child: Row(
                              children: [
                                const Icon(Icons.search, size: 36),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: TextField(
                                        controller: _controller,
                                        decoration: const InputDecoration(
                                            hintText: "Search",
                                            hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                            border: InputBorder.none)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.04,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Text("Products",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04)),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: helperProvider.imagesList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.03),
                                child: Card(
                                  elevation: 3,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.9,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Center(
                                        child: Image.asset(
                                            helperProvider.imagesList[index])),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.04,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Text("Buds",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04)),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: buds.length,
                            itemBuilder: (context, index) {
                              var productData = buds[index];
                              return GestureDetector(
                                onTap: () {
                                  print("Product Quantity ==> ${productData.yourProductQuantity}");
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(
                                    images: productData.imageUrl!,
                                    title: productData.title,
                                    description: productData.description,
                                    price: productData.price,
                                    yourProductQuantity: productData.yourProductQuantity,
                                  )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height *
                                          0.03),
                                  child: Card(
                                    elevation: 3,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.9,
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: CachedNetworkImage(
                                        imageUrl: productData.imageUrl![0],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.04,
                            top: MediaQuery.of(context).size.height * 0.01),
                        child: Text("Trimmer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04)),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: trimmers.length,
                            itemBuilder: (context, index) {
                              var productData = trimmers[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage(
                                    images: productData.imageUrl!,
                                    title: productData.title,
                                    description: productData.description,
                                    price: productData.price,
                                    yourProductQuantity: productData.yourProductQuantity,
                                  )));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.height *
                                          0.03),
                                  child: Card(
                                    elevation: 3,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.30,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Center(
                                        child: CachedNetworkImage(
                                          imageUrl: productData.imageUrl![0],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
            }),
      ),
    );
  }
}
