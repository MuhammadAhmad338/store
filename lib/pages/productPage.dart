// ignore_for_file: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductPage extends StatefulWidget {
  final List<dynamic>? images;
  final String? title;
  final String? description;
  final int? price;

  const ProductPage(
      {super.key, this.images, this.title, this.description, this.price});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  PageController? _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController!.dispose();
    super.dispose();
  }

  void onPageChanged(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.289,
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: onPageChanged,
                          children: [
                            for (int i = 0; i < widget.images!.length; i++)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CachedNetworkImage(
                                    imageUrl: widget.images![i]),
                              )
                          ],
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.022,
                        left: MediaQuery.of(context).size.height * 0.022,
                        child: GestureDetector(
                            onTap: () {
                              context.go("/");
                            },
                            child: const Icon(Icons.arrow_back))),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.images!.length; i++)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == i ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == i
                              ? Colors.blue
                              : Colors.grey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.04),
                        ),
                      )
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.016),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.001,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: Text(widget.title.toString()),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: Text(widget.price.toString()),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: AutoSizeText(
                  widget.description.toString(),
                  style: TextStyle(fontSize: 32),
                  maxLines: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.black
                      // This will make the button take the full width
                      ),
                  child: const Text("ADD TO CART",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16))),
            )
          ],
        ),
      ),
    );
  }
}
