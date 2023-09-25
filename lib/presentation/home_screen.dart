import 'package:dictionary/library.dart';
import 'package:dictionary/presentation/screen/create_screen.dart';
import 'package:dictionary/presentation/screen/main_screen.dart';
import 'package:dictionary/presentation/screen/my_word_screen.dart';
import 'package:dictionary/presentation/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController();
  int data = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          MainScreen(),
          MyWordScreen(),
          CreateScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 30
        ),
        selectedItemColor: Colors.white,
        onTap: (value){
          data = value;
          controller.jumpToPage(data);
          setState(() {});
          },
        currentIndex: data,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Main"),
          BottomNavigationBarItem(icon: Icon(Icons.data_exploration),label: "My Word"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),label: "Create"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
      )
    );
  }
}
