import 'package:assignment_app/screens/list_screen.dart';
import 'package:assignment_app/screens/random_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
//== Xu ly chuyen trang ============================
  List<Map<String, dynamic>> _pages = [];
  int _seclectedPageIndex = 0;

  void _selectPage(int index) {
    if (index == _seclectedPageIndex) return;
    setState(() {
      _seclectedPageIndex = index;
    });
  }

  void _backToHome() {
    setState(() {
      _seclectedPageIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      {
        'page': RandomScreen(),
        'title': 'Random',
      },
      {
        'page': ListScreen(),
        'title': 'List',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_seclectedPageIndex]['title']),
        centerTitle: true,
      ),
      body: _pages[_seclectedPageIndex]['page'],
      bottomNavigationBar: CurvedNavigationBar(
        onTap: _selectPage,
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 500),
        index: _seclectedPageIndex,
        height: 60,
        items: const [
          Icon(
            Icons.filter_tilt_shift,
            color: Colors.white,
          ),
          Icon(
            Icons.list_alt,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
