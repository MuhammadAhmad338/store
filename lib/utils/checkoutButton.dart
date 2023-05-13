import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final String label;
  const CheckoutButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(12),
            color: Colors.black),
        child: Center(
          child: Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight:
                  FontWeight.bold)),
        ),
      ),
    );
  }
}
