// ignore_for_file: file_names
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../services/cartServices.dart';
import '../utils/checkoutButton.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartServices>(context);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text("My Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black)),
                  ),
                 Row(

                   children: [
                     const Text("Clear the cart", style: TextStyle(
                       fontSize: 18
                     )),
                     Switch(
                       value: cartProvider.switchValue,
                       onChanged: (value) {
                         // Do something when the switch is toggled.
                         cartProvider.switchSwitch();
                         cartProvider.clearCart();
                       },
                       activeColor: Colors.blue,
                     ),
                   ],
                 )
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                child: ListView.builder(
                    itemCount: cartProvider.cart.length,
                    itemBuilder: (context, index) {
                      var cartSneakers = cartProvider.cart[index];
                      return Card(
                        elevation: 1,
                        child: Padding(
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
                                        onPressed: (context) {
                                          cartProvider.removeItemFromCart(
                                              cartSneakers.id);
                                        },
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
                                          imageUrl: cartSneakers.imageUrl[0]
                                              .toString(),
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
                                          Text(cartSneakers.name,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          Text(cartSneakers.category,
                                              style: const TextStyle(
                                                fontSize: 17,
                                              )),
                                          Row(
                                            children: [
                                              Text(
                                                  "\$ ${cartSneakers.price.toString()}",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03),
                                              Text(
                                                  "${cartSneakers.sizes[0]["size"]}",
                                                  style: const TextStyle(
                                                      fontSize: 20))
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              cartProvider
                                                  .increaseCount(cartSneakers);
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
                                          Text(cartSneakers.quantity.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                          GestureDetector(
                                            onTap: () {
                                              cartProvider
                                                  .decreaseCount(cartSneakers);
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
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      );
                    }),
              )
            ],
          ),
          const Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "Proceed To Checkout"))
        ],
      ),
    ));
  }
}
