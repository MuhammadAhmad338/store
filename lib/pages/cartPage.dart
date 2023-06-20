import 'package:flutter/material.dart';

import '../utils/customCard.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cart", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.15
                  )),
                  Text("Total Amount: \$${212}", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05
                  ))
                ]
              ),
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.01),
             Expanded(
               child: ListView.builder(
                 scrollDirection: Axis.vertical,
                   itemCount: 15,
                   itemBuilder: (context, index) {
                     return const Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Card(
                         elevation: 2,
                         child: CustomCard(),
                       ),
                     );
                   }))
          ],
        ),
      ),
    );
  }
}
