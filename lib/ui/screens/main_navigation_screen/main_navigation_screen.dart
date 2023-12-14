import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../search_screen/search_screen.dart';
import '../upcoming_screen/upcoming_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const UpcomingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      initialIndex: _selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => _updateIndex(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 1 ? Icons.search : Icons.search_outlined,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 2
                    ? Icons.video_collection
                    : Icons.video_collection_outlined,
              ),
              label: "Upcoming",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                _selectedIndex == 3 ? Icons.person : Icons.person_outlined,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
