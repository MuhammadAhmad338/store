import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? quantity;
  const CustomCard({Key? key,  this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.03),
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child:  CircleAvatar(radius: MediaQuery.of(context).size.width * 0.09,
            backgroundColor: Colors.pink,
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Title", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05
                )),
                Text("Subtitle", style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize:  MediaQuery.of(context).size.width * 0.04
                )),
                Text("\$${100.00}", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.06
                )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.27),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.close),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                        color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),  // Shadow color
                              spreadRadius: 2,                       // Spread radius
                              blurRadius: 5,                         // Blur radius
                              offset: const Offset(0, 3),                   // Offset in x and y directions
                            ),
                          ],
                    ),
                        child: const Icon(Icons.add, color: Colors.black,)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                     Text("1", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.025
                    )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                    Container(
                        decoration:  BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),  // Shadow color
                              spreadRadius: 2,                       // Spread radius
                              blurRadius: 5,                         // Blur radius
                              offset: const Offset(0, 3),                   // Offset in x and y directions
                            ),
                          ],
                        ),
                        child: const Icon(Icons.remove, color: Colors.black))
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
