// ignore: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mystore/models/user.dart';

class UserServices extends ChangeNotifier {
  
  Future<void> signInUser(UserModel userModel) async {
    try {
      var response = await http.post(Uri.parse("https://webappoo7.onrender.com/signIn"),
          headers: {"Content-Type": "application/json"},
          body: userModel.toJson());
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> signUpUser(UserModel userModel) async {
    try {
      var response = await http.post(Uri.parse("https://webappoo7.onrender.com/signUp"),
          headers: {"Content-Type": "application/json"},
          body: userModel.toJson());
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
      } 
    } catch (error) {
      print(error);
    }
  }

  Future<void> getAllUsers(UserModel userModel) async {
    try {
      var response = await http.get(Uri.parse("https://webappoo7.onrender.com/allUsers"));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
      }
    } catch(error) {
      print(error);
    }
  }

}
