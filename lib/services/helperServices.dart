// ignore: file_names
import 'package:flutter/services.dart' as the_bundle;
import 'package:mystore/models/sneakers.dart';

class HelperServices {
  
  static Future<List<Sneaker>> getMaleData() async {
    final sneakerJson = await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final data = sneakersFromJson(sneakerJson);

    return data;
  }

  static Future<List<Sneaker>> getFemaleData() async {
   final sneakerJson = await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
   final data = sneakersFromJson(sneakerJson);

   return data;
  }

  static Future<List<Sneaker>> getKidsData() async {
   final sneakerJson = await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
   final data = sneakersFromJson(sneakerJson);

   return data;
  }

}