// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mystore/models/user.dart';
import 'package:provider/provider.dart';
import 'package:mystore/pages/signInPage.dart';
import '../services/userServices.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserServices>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.05
              )),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                controller: _usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Username"
                ),                
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter email";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: "Email"
                ), 
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
                        username: _usernameController.text,
                         email: _emailController.text,
                       password: _passwordController.text));

                      _usernameController.clear();
                      _emailController.clear();
                      _passwordController.clear();
                    }
                  },
                  child: const Text(
                    "Create",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.black
                    ),
                  )),
               SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02
                  ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height * 0.01),
                   GestureDetector(
                    onTap: () {    
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignInScreen()));
                    },
                     child: Text("Sign In", style: TextStyle(
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
