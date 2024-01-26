import 'package:flutter/material.dart';
import 'today_page.dart';
import 'calendar_page.dart';
import 'profile_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '26 JAN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentSelectedIndex = 0;

  final _pages = [
    Today(),
    HomeScreen(),
    Calendar(),
    ProfilePage(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('16', style: TextStyle(fontSize: 50)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2023'),
                  Text('NOVEMBER', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Padding(
              padding:const EdgeInsets.only(left: 180.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {}, // Empty function for no action
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black, // Text color set to black
                      backgroundColor: Color(0xFFFFEFE7), // Button background color
                      shape:const RoundedRectangleBorder(
                        // Make the button rectangular
                        borderRadius: BorderRadius.zero, // Zero borderRadius for sharp edges
                      ),
                    ),
                    child: const Text(
                      'Today',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentSelectedIndex,
        onTap: (newIndex) {
          setState(() {
            _currentSelectedIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: IconTheme(
                data: IconThemeData(),
                child: Icon(Icons.access_time),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconTheme(
                data: IconThemeData(),
                child: Icon(Icons.home_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconTheme(
                data: IconThemeData(),
                child: Icon(Icons.calendar_today_outlined),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: IconTheme(
                data: IconThemeData(),
                child: Icon(Icons.person_outline),
              ),
              label: ''),
        ],
      ),
    );
  }
}
