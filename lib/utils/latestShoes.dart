import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore/utils/staggeredTile.dart';
import '../models/sneakers.dart';

class LatestShoes extends StatelessWidget {
  final List<Sneaker> sneakers;
  const LatestShoes({Key? key, required this.sneakers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: sneakers.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.2),
              itemBuilder: (context, index) {
                var shoe = sneakers[index];
                Sneaker sneakerShoe = Sneaker(id: shoe.id,
                  name: shoe.name, category: shoe.category,
                  imageUrl: shoe.imageUrl, price: shoe.price, description: shoe.description,
                  title: shoe.title, oldPrice: shoe.price, sizes: shoe.sizes,
                );
                print(shoe);
                return GestureDetector(
                  onTap:() {
                    context.go("/productPage", extra: sneakerShoe);
                  },
                  child: StaggeredTile(
                      imageUrl: shoe.imageUrl[0],
                      title: shoe.name,
                      price: shoe.price
                  ),
                );
              });
  }
}
