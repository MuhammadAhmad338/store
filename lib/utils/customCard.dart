import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? quantity;
  const CustomCard({Key? key,  this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
      decoration: BoxDecoration(
          color: Colors.black12,
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
      ),
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child: const CircleAvatar(radius: 32,
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
                  fontSize: MediaQuery.of(context).size.width * 0.06
                )),
                Text("Subtitle", style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize:  MediaQuery.of(context).size.width * 0.04
                ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.45),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: const BoxDecoration(
                    color: Colors.white,
                      shape: BoxShape.circle
                ),
                    child: const Icon(Icons.add,)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0025),
                 Text("1 ${quantity}", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.025
                )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0025),
                Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.remove))
              ],
            ),
          )

        ],
      ),
    );
  }
}
