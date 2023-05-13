// ignore_for_file: file_names
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../services/helperServices.dart';
import '../utils/checkoutButton.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    context.go("/");
                  },
                  icon: const Icon(AntIcons.closeOutlined)),
              GestureDetector(
                onTap: () {},
                child: const Text("My Cart",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black)),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 1,
                                      backgroundColor: Colors.black,
                                      onPressed: (context) {},
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    )
                                  ]),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
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
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: CachedNetworkImage(
                                        imageUrl: "",
                                        height: 70,
                                        width: 70,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text("Ultra Shoes",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                        const Text("Men's Running",
                                            style: TextStyle(
                                              fontSize: 17,
                                            )),
                                        Row(
                                          children: [
                                            const Text("79.00",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 20)),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08,
                                            ),
                                            const Text("Size",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20)),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                            const Text("6.5",
                                                style: TextStyle(fontSize: 20))
                                          ],
                                        ),
                                      ],
                                    ),
                                    Consumer<HelperServices>(
                                        builder: (_, provider, __) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                           provider.incrementCount();
                                      },
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Text(provider.count.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          GestureDetector(
                                            onTap: () {
                                            provider.decrementCount();
                                          },
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black),
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }),
              )
            ],
          ),

           const Align(
            alignment: Alignment.bottomCenter,
            child: CheckoutButton(label: "Proceed To Checkout")
          )
        ],
      ),
    ));
  }
}
