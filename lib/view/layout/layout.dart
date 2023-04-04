import 'package:flutter/material.dart';

import '../../theme/pallete.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/theme_switch.dart';
import 'chat_screen.dart';
import 'home_page.dart';
import 'settings.dart';





class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  static  List<Widget> _pages = <Widget>[    HomePage(),    ChatScreen(),    Settings(), ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Therapist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Therapist bot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,

        unselectedLabelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        backgroundColor: Theme.of(context).colorScheme.secondary,

        selectedLabelStyle:TextStyle(color:Theme.of(context).colorScheme.primary,) ,
        onTap: _onItemTapped,

      ),
    );
  }
}
