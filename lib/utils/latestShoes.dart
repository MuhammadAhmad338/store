import 'package:flutter/material.dart';
import 'package:mystore/utils/staggeredTile.dart';
import '../services/helperServices.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
        future: HelperServices.getFemaleData(),
        builder: (context, snapshot) {
          var femaleShoes = snapshot.data;
          if (!snapshot.hasData) {
            return Text("Error ${snapshot.error}");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: femaleShoes!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.2),
              itemBuilder: (context, index) {
                var femaleShoe = femaleShoes![index];
                return  StaggeredTile(
                    imageUrl: femaleShoe.imageUrl[1],
                    title: femaleShoe.name,
                    price: femaleShoe.price
                );
              });
        }
    );
  }
}
