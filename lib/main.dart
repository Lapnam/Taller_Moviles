import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/chats_screen.dart';
import 'screens/laboratory_screen.dart';

void main() {
  runApp(const MusicFlowApp());
}

class MusicFlowApp extends StatelessWidget {
  const MusicFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MusiccisuM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  String _getTitle() {
    if (_selectedIndex == 0) {
      return 'MusiccisuM';
    } else if (_selectedIndex == 1) {
      return 'Chats';
    } else {
      return 'Laboratorio de Volumen';
    }
  }


  Widget _getBody() {
    if (_selectedIndex == 0) {
      return const HomeScreen();
    } else if (_selectedIndex == 1) {
      return const ChatsScreen();
    } else {
      return const LaboratoryScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 9, 37),
        foregroundColor: Colors.white,
        title: Text(_getTitle(),
                style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 54, 44, 69),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science_sharp),
            label: 'Laboratorio',
          ),
        ],
      ),
    );
  }
}