// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';
import '../models/sneakers.dart';
import '../services/favouriteServices.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<FavouriteServices>(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.cover))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("My Favourites",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white)),
                    Text(
                      "Count: ${productProvider.favSneakers.length}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: ListView.builder(
                      itemCount: productProvider.favSneakers.length,
                      itemBuilder: (context, index) {
                        var sneaker = productProvider.favSneakers[index];
                        return Card(
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: GestureDetector(
                                onTap: () {
                                  productProvider.removeSneakers(sneaker);
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade500,
                                            blurRadius: 0.3,
                                            spreadRadius: 5,
                                            offset: const Offset(0, 1))
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: sneaker.imageUrl[0],
                                        height: 70,
                                        width: 70,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            sneaker.title.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                          Text(sneaker.category.toString(),
                                              style:
                                                  const TextStyle(fontSize: 16)),
                                          Text(sneaker.price.toString(),
                                              style:
                                                  const TextStyle(fontSize: 16))
                                        ],
                                      ),
                                      const Icon(
                                        Ionicons.heart_dislike_circle_outline,
                                        size: 36,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
