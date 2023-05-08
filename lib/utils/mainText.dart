// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainText extends StatelessWidget {
  final String text;
  const MainText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12.w),
    );
  }
}
