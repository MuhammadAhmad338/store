// ignore_for_file: file_names
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Sign In",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter something";
                }
                return null;
              },
              decoration: const InputDecoration(border: InputBorder.none),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
               if (value!.isEmpty) {
                return "Please enter a password";
               }
               return null;
              },
              decoration: const InputDecoration(border: InputBorder.none),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ElevatedButton(
                onPressed: () {
                   if (_formKey.currentState!.validate()) {


                     _emailController.clear();
                     _passwordController.clear();
                  }
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
