import 'package:flutter/material.dart';
import 'package:keepinjournal/createnote.dart';
import 'package:keepinjournal/home.dart';
import 'package:keepinjournal/theme.dart';
import 'package:keepinjournal/todolist.dart';
import 'package:keepinjournal/usercalender.dart';
import 'package:keepinjournal/userprofile.dart';


class BottomNanBar extends StatefulWidget {
  const BottomNanBar({Key? key}) : super(key: key);

  @override
  State<BottomNanBar> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<BottomNanBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Myhome(),
    UserCalender(),
    CreateNote(),
    UserTodoList(),
    UserTheme(),
    UserProfile(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),

      ),
      bottomNavigationBar: BottomNavigationBar(


        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            backgroundColor: Colors.white70,
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white70,
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Calender',
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.white70,
            icon: Icon(Icons.remember_me),
            label: 'TodoList',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white70,
            icon: Icon(Icons.cleaning_services_rounded),
            label: 'Theme',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white70,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[100],
        onTap: _onItemTapped,
      ),
    );
  }
}
