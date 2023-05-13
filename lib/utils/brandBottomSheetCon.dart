import 'package:flutter/material.dart';

class BrandContainer extends StatelessWidget {
  final String image;
  const BrandContainer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 60,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          color: Colors.grey.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
