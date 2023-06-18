// ignore_for_file: file_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:mystore/services/imageServices.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var imageProvider = Provider.of<ImageServices>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imageProvider.image != null
                  ? Stack(
                      children: [
                        CircleAvatar(
                            radius: 64,
                            backgroundColor:
                                const Color.fromARGB(255, 241, 240, 146),
                            backgroundImage: FileImage(imageProvider.image!)),
                        GestureDetector(
                          onTap: () {
                              imageProvider.pickFromGallery(context);
                          },
                          child: const Positioned(
                            bottom: 5.0,
                            right: 5.0,
                            child: Icon(
                              Icons.camera_alt,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        const CircleAvatar(
                          radius: 64,
                          backgroundColor: Color.fromARGB(255, 241, 240, 146),
                          backgroundImage:
                              AssetImage("assets/images/adidas.png"),
                        ),
                        GestureDetector(
                          onTap: () {
                            imageProvider.pickFromGallery(context);
                          },
                          child: const Positioned(
                            bottom: 2.0,
                            right: 5.0,
                            child: Icon(
                              Icons.camera_alt,
                              size: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
              Column(
                children: [
                  Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text("Invite a friend",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white)),
                  ),
                ]),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text("Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white)),
                  ),
                ]),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text("Log Out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white)),
                  ),
                ]),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24)),
              )
            ],
          ),
        ));
  }
}
