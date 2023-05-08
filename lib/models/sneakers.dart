// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<Sneaker> sneakersFromJson(String str) => List<Sneaker>.from(json.decode(str).map((x) => Sneaker.fromJson(x)));

class Sneaker {
  
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String price;
  final String description;
  final String title;
  final String oldPrice;
  final List<dynamic> sizes;

  Sneaker({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.title,
    required this.oldPrice,
    required this.sizes,
  });

   factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        price: json["price"],
        description: json["description"],
        title: json["title"],
  );
}
