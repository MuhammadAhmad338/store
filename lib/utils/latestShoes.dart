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
                return GestureDetector(
                  onTap:() {
                    context.go(Uri(
                        path: "/productPage",
                        queryParameters: {
                          'title': shoe.title,
                          'name': shoe.name,
                          'category': shoe.category,
                          'price': shoe.price,
                          'imageUrl': '${shoe.imageUrl}',
                          'description': shoe.description,
                          'sizes': '${shoe.sizes}'
                        }).toString());
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
