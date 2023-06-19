// ignore_for_file: file_names, unused_local_variable
import 'package:flutter/material.dart';
import 'package:mystore/services/imageServices.dart';
import 'package:mystore/services/themeServices.dart';
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
    var themeProvider = Provider.of<ThemeService>(context);

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                               Colors.transparent,
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
                            ),
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        const CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("assets/images/profile-user.png"),
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
                              size: 30.0
                            ),
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.022,
                    ),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.033
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24)),
                child:  Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
                    child: Image.asset("assets/images/inviteFriend.png",
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.white)
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text("Invite a friend",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white)),
                  ),
                ]),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.012),
              GestureDetector(
                onTap: () {
                  themeProvider.toggleTheme();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(24)),
                  child:  Row(children: [
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
                      child: Image.asset("assets/images/brightness.png",
                        height: MediaQuery.of(context).size.height * 0.05,
                        color: Colors.white,
                      )
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text("Dark Mode",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.white)),
                    ),
                  ]),

                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
                    child: Image.asset("assets/images/setting.png",
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.white,
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text("Settings",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white)),
                  ),
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.012,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08),
                    child: Image.asset("assets/images/logout.png",
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.white,
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text("Log Out",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white)),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
