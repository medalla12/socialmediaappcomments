import 'package:flutter/material.dart';
import 'homepage.dart';
import 'search_page.dart';
import 'reels_page.dart';
import 'profile_page.dart';
import 'add_post_page.dart';

void main() => runApp(const InstagramClone());

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tinatanggal yung "Debug" banner sa gilid
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainNavigation(), // Unang screen na lalabas
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Index kung nasaan tayo ngayon (0 = Home, 1 = Search, etc.)
  int _currentIndex = 0;

  // Listahan ng mga pages na pwedeng puntahan sa bottom nav
  final List<Widget> _screens = [
    const HomePage(),
    const SearchPage(),
    const AddPostPage(),
    const ReelsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Pinapakita ang screen base sa _currentIndex
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Naka-highlight na icon
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Pinapalitan ang page pag pinindot
          });
        },
        type: BottomNavigationBarType.fixed, // Para hindi gumalaw yung mga icons pag pinindot
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false, // Instagram style: walang text sa ilalim ng icon
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.movie_outlined), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}