// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final int? quantity;
  final int? price;
  final String? category;
  final List<dynamic>? imageUrl;
  int yourProductQuantity;

  ProductModel(
      {this.id ,
      this.title,
      this.description,
      this.quantity,
      this.price,
      this.category,
      this.imageUrl,
      this.yourProductQuantity = 1
      });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'quantity': quantity,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] as String,
      description: map['description'] as String,
      quantity: map['quantity'] as int,
      price: map['price'] as int,
      category: map['category'] as String,
      imageUrl: List<String>.from((map['imageUrl'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
