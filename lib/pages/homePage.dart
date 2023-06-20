import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
               Row(
                 children: [
                   Text("Home", style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: MediaQuery.of(context).size.width * 0.15
                   ))
                 ],
               )
            ],
          ),
        ),
      )
    );
  }
}
