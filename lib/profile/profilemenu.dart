import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(  {Key? key,
    required this.text,
    required this.iconData,
    required this.color,
    required this.colorbg,
    this.press,
  }) : super(key: key);
  final String text ;
  final IconData iconData;
  final Color color;
  final Color colorbg;
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15, top: 15),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: colorbg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(iconData, color: color,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(text),
          ),
          Icon(Icons.arrow_forward_ios_outlined,
          size: 15,)
        ],
      ),
    );
  }
}