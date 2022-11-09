import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keepinjournal/model/usermodel.dart';
import 'package:keepinjournal/profile/accsetting.dart';
import 'package:keepinjournal/profile/myfav.dart';
import 'package:keepinjournal/profile/profilemenu.dart';
import 'package:keepinjournal/screens/login.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loginUser = UserModel();

  @override
  void initState(){
    super.initState();
    FirebaseFirestore.instance.collection("users")
    .doc(user!.uid)
    .get()
    .then((value){
      this.loginUser = UserModel.fromMap(value.data());
      setState(() {

      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.perm_identity_sharp,
                        color: Colors.white,
                      ),
                    ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text("${loginUser.name}"
                  ,
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
            Divider(thickness: 1.5,),

            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccSetting()));
              },
              child: ProfileMenu(
                text: "Account Setting",
                iconData: Icons.person_outline_outlined,
                color: Colors.deepPurpleAccent.shade200,
                colorbg: Colors.purple.shade50,
                press: () {},
              ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFav()));
              },
              child: ProfileMenu(
              text: "My Favorites",
              iconData: Icons.favorite_border,
              color: Colors.pink,
              colorbg: Colors.red.shade50,
              press: () {},
            ),
            ),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFav()));
              },
              child: ProfileMenu(
                text: "Notification",
                iconData: Icons.notifications_none_outlined,
                color: Colors.green,
                colorbg: Colors.green.shade50,
                press: () {},
              ),
            ),
            SizedBox(height: 15,),
            Divider(thickness: 1.5,),
            MaterialButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mylogin()));
              },
              child: ProfileMenu(
                text: "Log Out",
                iconData: Icons.logout_outlined,
                color: Colors.blue,
                colorbg: Colors.lightBlue.shade50,
                press: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}



