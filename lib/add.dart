import 'package:appointment/addstudent.dart';
import 'package:appointment/interview.dart';
import 'package:appointment/profile.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _selectedIndex = 1;
  static const List<Widget> _widgetOptions = [interview(), add(), profil()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              label: "home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "add",
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: "person",
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
