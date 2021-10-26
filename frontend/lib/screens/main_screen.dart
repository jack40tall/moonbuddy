import 'package:flutter/material.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/data_models/user.dart';
import 'package:frontend/screens/dashboard_screen.dart';
import 'package:frontend/screens/holdings_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context).settings.arguments as User;

    // DEBUG
    final args =
        new User(1, "test@test.com", "Testy", "T", "McTester", 0, "TestToken");

    List<Widget> _widgetOptions = <Widget>[
      Center(
        child: DashboardScreen(currUser: args),
      ),
      Center(
        child: HoldingsScreen(currUser: args),
      ),
      Center(
        child: Text('It\'s sunny here'),
      ),
    ];

    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard\n',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Bots\n',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings\n',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.white,
        selectedItemColor: kSecondaryPinkDark,
        backgroundColor: kBackgroundDark,
        selectedFontSize: 14,
        unselectedFontSize: 14,
      ),
    );
  }
}
