// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mystore/pages/checkOutPage.dart';
import '../services/cartServices.dart';
import '../utils/customCard.dart';

class CartPage extends StatelessWidget {

  final String? title;
  final String? price;
  final String? imageUrl;
  final int? yourProductQuantity;

  const CartPage({Key? key,
    this.title,
    this.price,
    this.imageUrl,
    this.yourProductQuantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartServices>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                  bottom: MediaQuery.of(context).size.width * 0.01,
                  right: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.15)),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Center(
                                child: Image.asset(
                                    "assets/images/add-to-basket.png",
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    height: MediaQuery.of(context).size.height *
                                        0.15)),
                            Positioned(
                                top: 0,
                                left: 30,
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(36)),
                                    child:  Center(
                                      child: Text(cartProvider.product.length.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    )))
                          ],
                        )),
                  ]),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: cartProvider.product.length,
                    itemBuilder: (context, index) {
                      var cartProducts = cartProvider.product[index];
                      //  print(cartProducts.id);
                      return Padding(
                        padding: EdgeInsets.only(
                             left: MediaQuery.of(context).size.width * 0.04,
                            bottom: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.04),
                        child:  Card(
                          elevation: 7,
                          child: CustomCard(
                            title: cartProducts.title,
                            price: cartProducts.price,
                            imageUrl: cartProducts.imageUrl![0],
                            yourProductQuantity: cartProducts.yourProductQuantity,
                            index: index
                          ),
                        ),
                      );
                    })),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.0066,
                left: MediaQuery.of(context).size.width * 0.066,
                bottom: MediaQuery.of(context).size.width * 0.0066,
                right: MediaQuery.of(context).size.width * 0.066,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.040,
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.036),
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.008),
                      Text(
                        "USD",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.036,
                  right: MediaQuery.of(context).size.width * 0.036),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.0002,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black)),
            ),
            GestureDetector(
                onTap: () {
                  // Do something
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckPage()));
                },
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.027),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text(
                        'Proceed To Checkout',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
