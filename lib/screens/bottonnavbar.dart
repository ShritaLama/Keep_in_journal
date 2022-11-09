import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:keepinjournal/calender/usercalender.dart';
import 'package:keepinjournal/note/home.dart';
import 'package:keepinjournal/theme/theme.dart';
import 'package:keepinjournal/todo/todolist.dart';
import 'package:keepinjournal/profile/userprofile.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
  ];

  void _onItemTapped(int index) {
  setState(() {
  _selectedIndex = index;
  });
  }
  final List<Widget> _pages = [
    Myhome(),
    UserCalender(),
    UserTodoList(),
    UserTheme(),
    UserProfile(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _pages[_selectedIndex],

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GNav(
            onTabChange: _onItemTapped,
            backgroundColor: Colors.white,
            color: Colors.purple.shade100,
            activeColor: Colors.deepPurpleAccent.shade100,
            tabBackgroundColor: Colors.white,
            gap: 6,
            padding: EdgeInsets.all(14),
            tabs: const [
              GButton(
                  icon: Icons.home_outlined,
                  text: 'Home'),
              GButton(
                  icon: Icons.calendar_month_outlined,
                  text: 'Calender',
              ),
              GButton(
                  icon: Icons.playlist_add_check_circle_outlined,
                  text: 'TodoList',
              ),
              GButton(
                  icon: Icons.cleaning_services_outlined,
                  text: 'Themes',
              ),
              GButton(
                  icon: Icons.perm_identity,
                  text: 'Profile',
              ),
            ]
          ),
        ),
      ),
    );
  }
}
