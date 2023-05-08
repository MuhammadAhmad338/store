import 'package:flutter/material.dart';

class StaggeredTile extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String price;

  const StaggeredTile({Key? key,
    required this.imageUrl,
    required this.title,
    required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
          boxShadow:  [
            BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1))
          ]
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Image.network(imageUrl, fit: BoxFit.fill,),
            Container(
              height: 100,
              padding:  const EdgeInsets.only(top: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(title, style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                  Text(price, style: const TextStyle(
                      fontWeight: FontWeight.normal
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
