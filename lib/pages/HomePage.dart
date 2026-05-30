import 'package:flutter/material.dart';
import 'CourseCatalogue.dart';
import 'CourseRegistration.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; 
  bool _isSideMenuOpen = false; 

  // 1. 把你的页面按顺序放进列表
  final List<Widget> _pages = [
    const CourseCatalogue(),    
    const CourseRegistration(), 
    const Center(child: Text('Personal Center')), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Student Portal'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: () => setState(() => _isSideMenuOpen = !_isSideMenuOpen),
        ),
      ),
      body: Row(
        children: [
          if (_isSideMenuOpen)
            SideMenu(
              builder: (data) => SideMenuData(
                header: const Text(''),
                items: [
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 0,
                    onTap: () => setState(() => _currentIndex = 0),
                    title: 'Course Catalogue',
                    icon: const Icon(Icons.list),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 1,
                    onTap: () => setState(() => _currentIndex = 1),
                    title: 'Course Registration',
                    icon: const Icon(Icons.app_registration),
                  ),
                  SideMenuItemDataTile(
                    isSelected: _currentIndex == 2,
                    onTap: () => setState(() => _currentIndex = 2),
                    title: 'Personal Center',
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
            ),
          Expanded(
            child: _pages[_currentIndex],
          ),
        ],
      ),
    );
  }
}