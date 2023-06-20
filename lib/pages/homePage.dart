import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.06,
                bottom: MediaQuery.of(context).size.width * 0.01,
                right: MediaQuery.of(context).size.width * 0.06),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Home",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.15)),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset("assets/images/inviteFriend.png", fit: BoxFit.cover,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.001),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.06,
                right: MediaQuery.of(context).size.width * 0.06),
            child: Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                child: Row(
                  children: [
                    const Icon(Icons.search, size: 36),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                border: InputBorder.none)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.04,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Text("Products",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.04)),
          )
        ],
      ),
    ));
  }
}
