import 'package:flutter/material.dart';
import 'package:mental_health/screens/Profile_Screen.dart';
import 'package:mental_health/screens/VideosScreen.dart';
import 'package:mental_health/screens/relaxed.dart';
import 'package:mental_health/screens/task.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> screens = [
    const Task(),
   VideoScreen(),
    const Relaxed(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFfaddde),
        elevation: 0,
        currentIndex: currentIndex,
          selectedItemColor: const Color(0xFFe85076), 
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items:const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
           BottomNavigationBarItem(icon: Icon(Icons.video_library_sharp), label: "Videos"),
           BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: "Relaxed"),
           BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
       
      ),
    );
  }
}