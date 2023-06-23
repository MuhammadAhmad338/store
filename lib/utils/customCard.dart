import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mystore/services/cartServices.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class CustomCard extends StatefulWidget {
  final String? title;
  final int? price;
  final String? imageUrl;
  int? yourProductQuantity;
  int? index;

  CustomCard(
      {Key? key,
      this.title,
      this.price,
      this.imageUrl,
      this.yourProductQuantity,
      this.index})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    var cartServices = Provider.of<CartServices>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.09,
              backgroundColor: Colors.pink,
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl.toString(),
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        fontSize: MediaQuery.of(context).size.width * 0.05)),
                Text("Subtitle",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: MediaQuery.of(context).size.width * 0.04)),
                Text(widget.price.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.06)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    cartServices.removeItemFromCart(widget.index!);
                  },
                  child: const Icon(Icons.close)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      cartServices.increaseQuantity(widget.index!);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 5, // Blur radius
                              offset: const Offset(
                                  0, 3), // Offset in x and y directions
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                  Text(widget.yourProductQuantity.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:
                              MediaQuery.of(context).size.height * 0.025)),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                  GestureDetector(
                    onTap: () {
                      cartServices.decreaseQuantity(widget.index!);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 2, // Spread radius
                              blurRadius: 5, // Blur radius
                              offset: const Offset(
                                  0, 3), // Offset in x and y directions
                            ),
                          ],
                        ),
                        child: const Icon(Icons.remove, color: Colors.black)),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
