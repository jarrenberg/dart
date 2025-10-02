import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/balance_widget.dart';
import 'game_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  User user = User(name: "Jugador", email: "jugador@casino.com");

  final List<Widget> _screens = [
    GamesScreen(),
    ProfileScreen(user: User(name: "Jugador", email: "jugador@casino.com")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Casino Royal'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          BalanceWidget(user: user),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.casino),
            label: 'Juegos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}