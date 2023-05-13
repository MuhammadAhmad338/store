import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';
import '../services/helperServices.dart';
import '../services/productServices.dart';
import '../utils/checkoutButton.dart';

class ProductPage extends StatefulWidget {

  final List<String> images;
  final String title;
  final String name;
  final String category;
  final String description;
  final String price;
  final List<dynamic> sizes;
  const ProductPage({
    Key? key,
    required this.images,
    required this.title,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.sizes,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<HelperServices>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            floating: true,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.go("/");
                      },
                      icon: const Icon(AntIcons.closeOutlined)),
                  IconButton(
                      onPressed: () {},
                      color: Colors.black,
                      icon: const Icon(Ionicons.ellipsis_horizontal))
                ],
              ),
            ),
            backgroundColor: Colors.white,
            pinned: true,
            snap: false,
            expandedHeight: MediaQuery.of(context).size.height,
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                Container(
                    color: Colors.grey.withOpacity(.1),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Consumer<ProductServices>(
                              builder: (_, provider, __) {
                            return PageView.builder(
                                itemCount: widget.images.length,
                                scrollDirection: Axis.horizontal,
                                controller: _pageController,
                                onPageChanged: (newIndex) {
                                  provider.updateIndex(newIndex);
                                },
                                itemBuilder: (context, index) {
                                  var singleImage = widget.images[index];
                                  return Stack(
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.39,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: CachedNetworkImage(
                                            imageUrl: singleImage,
                                            fit: BoxFit.contain),
                                      ),
                                      Positioned(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.09,
                                          right: 20,
                                          child: const Icon(
                                              AntIcons.heartOutlined)),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          left: 0,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children:
                                                  List.generate(4, (index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  child: CircleAvatar(
                                                    radius: 5,
                                                    backgroundColor:
                                                        provider.currentIndex !=
                                                                index
                                                            ? Colors.grey
                                                            : Colors.black,
                                                  ),
                                                );
                                              }))),
                                    ],
                                  );
                                });

                        })),
                Positioned(
                  bottom: 30,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.645,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(widget.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: Colors.black)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text(widget.category,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22)),
                                        RatingBar.builder(
                                            itemSize: 22,
                                            itemBuilder: (context, index) {
                                              return const Icon(Icons.star,
                                                  color: Colors.black);
                                            },
                                            onRatingUpdate: (newValue) {}),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                     Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('\$${widget.price}',
                                            style: const  TextStyle(

                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 22)),
                                        const Row(
                                          children: [
                                            Text("Colors",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 22)),
                                            SizedBox(width: 5),
                                            CircleAvatar(
                                              backgroundColor: Colors.black,
                                              radius: 5,
                                            ),
                                            SizedBox(width: 5),
                                            CircleAvatar(
                                              radius: 5,
                                              backgroundColor: Colors.red,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Row(
                                      children: [
                                        const Text("Select a size",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.black)),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                        const Text("View size guide",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    SizedBox(
                                        height: 40,
                                        child: ListView.builder(
                                            itemCount: widget.sizes.length,
                                            scrollDirection: Axis.horizontal,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              productProvider.shoeSizes =
                                                  widget.sizes;
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                child: ChoiceChip(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      side: const BorderSide(
                                                          color: Colors.black,
                                                          width: 1,
                                                          style: BorderStyle
                                                              .solid)),
                                                  disabledColor: Colors.white,
                                                  label: Text(
                                                      productProvider
                                                          .shoes[index]["size"],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18)),
                                                  selected: productProvider
                                                          .shoes[index]
                                                      ['isSelected'],
                                                  onSelected: (newState) {
                                                    productProvider
                                                        .toggleSelectedShoes(
                                                            index);
                                                  },
                                                ),
                                              );
                                            })),
                                    const SizedBox(height: 7),
                                    const Divider(
                                        indent: 10,
                                        endIndent: 10,
                                        color: Colors.black),
                                    const SizedBox(height: 7),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Text(widget.title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22)),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(widget.description,
                                        textAlign: TextAlign.justify,
                                        maxLines: 4,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                    const SizedBox(height: 7),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                            onTap: () {
                                              context.go("/cart");
                                            },
                                            child: const CheckoutButton(label: "Add To Cart")))
                                  ],
                                )
  )
                        )),
                  ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
