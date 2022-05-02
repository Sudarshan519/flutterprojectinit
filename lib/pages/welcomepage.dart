// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;
  final tabs = [
    // Center(
    //   child: Text("Home"),
    // ),
    // Center(
    //   child: Text("Search"),
    // ),
    // Center(
    //   child: Text("Favorite"),
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    //scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 20),
                    children: [
                      Image.asset("assets/image.jpg"),
                      Image.asset("assets/image.jpg"),
                      Image.asset("assets/image.jpg"),
                      Image.asset("assets/image.jpg"),
                      Image.asset("assets/image.jpg"),
                      Image.asset("assets/image.jpg"),
                    ],
                  ),
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
                size: 35,
                color: _currentIndex == 0 ? Colors.white : Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.heart_broken,
                size: 35,
                color: _currentIndex == 1 ? Colors.white : Colors.black,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 35,
                color: _currentIndex == 2 ? Colors.white : Colors.black,
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
    );
  }
}
