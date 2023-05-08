// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {

  final void Function()? onTap;
  final IconData? icon;

  const BottomBar({super.key,
    required this.onTap,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        width: 36,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
