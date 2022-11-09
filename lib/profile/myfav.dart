import 'package:flutter/material.dart';
class MyFav extends StatefulWidget {
  const MyFav({Key? key}) : super(key: key);

  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,size: 15,color: Colors.black,),
        ),
        ),
    );
  }
}
