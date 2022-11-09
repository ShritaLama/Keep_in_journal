import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keepinjournal/screens/bottonnavbar.dart';
import 'package:keepinjournal/screens/login.dart';
import 'package:keepinjournal/screens/singup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirebaseAuth.instance.currentUser?.uid == null ? HomePage() : const BottomNavBar() ,
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/main.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 350,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50,top: 0,right: 50,bottom: 0),
                child: MaterialButton(
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mylogin()));
                  },
                  // defining the shape
                  color: Colors.purple.shade100,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text(
                    "Login",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 0, right: 50, bottom: 0),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  // defining the shape
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Sign Up",
                    style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

