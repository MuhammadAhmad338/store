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
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.06,
                  bottom: MediaQuery.of(context).size.width * 0.01,
                  right: MediaQuery.of(context).size.width * 0.06
              ),
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
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.04,
                              bottom: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04),
                          child: const Card(
                            elevation: 7,
                            child: CustomCard(),
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}
