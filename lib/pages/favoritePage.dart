import 'package:flutter/material.dart';
import '../utils/customCard.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("Favorites",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.15)),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: CustomCard(),
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}
