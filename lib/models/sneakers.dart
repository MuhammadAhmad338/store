import 'dart:convert';


// ignore_for_file: public_member_api_docs, sort_constructors_first

class Sneaker {
  
  final int id;
  final String name;
  final String category;
  final List<dynamic> imageUrl;
  final double price;
  final String description;
  final String title;
  final double oldPrice;
  final List<dynamic> sizes;
  int quantity;
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
     this.quantity = 1,
  });
 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'description': description,
      'title': title,
      'oldPrice': oldPrice,
      'sizes': sizes,
      'quantity': quantity,
    };
  }

  factory Sneaker.fromJson(Map<String, dynamic> map) {
    return Sneaker(
      id: map['id'] as int,
      name: map['name'] as String,
      category: map['category'] as String,
      imageUrl: List<dynamic>.from((map['imageUrl'] as List<dynamic>)),
      price: map['price'] as double,
      description: map['description'] as String,
      title: map['title'] as String,
      oldPrice: map['oldPrice'] as double,
      sizes: List<dynamic>.from((map['sizes'] as List<dynamic>)),
      quantity: map['quantity'] as int,
    );
  }


}

List<Sneaker> sneakersFromJson(String str) => List<Sneaker>.from(json.decode(str).map((x) => Sneaker.fromJson(x)));
