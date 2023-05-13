import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const  EdgeInsets.all(12.0),
      decoration:  BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Text(text.toString()),
    );
  }
}
