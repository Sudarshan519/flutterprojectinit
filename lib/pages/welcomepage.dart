// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;
  final tabs = [
    // Center(
    //   child: Text("Text"),
    // ),
    
    // Center(
    //   child: Text("Search"),
    // ),

  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          "Welcome Judy",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/user.jpg"),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  "assets/image.jpg",
                                  width: 150,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  child: Text(
                                "About\nHeart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  "assets/image.jpg",
                                  width: 150,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  child: Text(
                                "Balance\nDiet",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  "assets/image.jpg",
                                  width: 150,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  child: Text(
                                "Good\nSleep",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  "assets/image.jpg",
                                  width: 150,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  child: Text(
                                "Regular\nExercise",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  "assets/image.jpg",
                                  width: 150,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  child: Text(
                                "Donate\nHere",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Opacity(
                                opacity: 0.5,
                                child: Image.asset(
                                  "assets/image.jpg",
                                  width: 150,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                  child: Text(
                                "Learn\nMore",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.red,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                  size: 25,
                  color: _currentIndex == 0 ? Colors.white : Colors.black,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.heartPulse,
                  size: 25,
                  color: _currentIndex == 1 ? Colors.white : Colors.black,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Transform.rotate(
                  angle: 15,
                  child: Icon(
                    FontAwesomeIcons.handshake,
                    size: 25,
                    color: _currentIndex == 2 ? Colors.white : Colors.black,
                  ),
                ),
                label: "",
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}



