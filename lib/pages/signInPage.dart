// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mystore/models/user.dart';
import 'package:mystore/pages/signUpPage.dart';
import 'package:mystore/services/userServices.dart';
import 'package:provider/provider.dart';

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
     var userProvider = Provider.of<UserServices>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding:  const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text("Sign In",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.05
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter something";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Email"
                )
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
                decoration: const InputDecoration(
                  labelText: "Password"
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ElevatedButton(
                  onPressed: () {
                     if (_formKey.currentState!.validate()) {
                userProvider.signUpUser(UserModel(
    
                         email: _emailController.text,
                       password: _passwordController.text)); 
                        
                       _emailController.clear();
                       _passwordController.clear();
                    }
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.02
                    ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.height * 0.01),
                     GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpPage()));
                      },
                       child: Text("Create One", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.025
                        )),
                     )
                  ],
                 )
            ],
          ),
        ),
      ),
    );
  }
}
