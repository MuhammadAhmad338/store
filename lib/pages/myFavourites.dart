// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("MY Favourate", style:  TextStyle(
                fontWeight: FontWeight.bold
            )),
            ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container();
                })
          ],
        ),
      ),
    );
  }
}