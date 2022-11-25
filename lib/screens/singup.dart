import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keepinjournal/screens/login.dart';
import '../model/usermodel.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  var name = " ";
  var email = " ";
  var password = " ";
  var confirmpasword = " ";

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final nameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmpasswordcontroller = new TextEditingController();

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
                image: AssetImage('images/backg.png'),
                fit: BoxFit.cover,
              ),
              Container(
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Column(
                          children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Create A New Account",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: nameEditingController,
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{3,}$');
                                if (value!.isEmpty) {
                                  return ("Name cannot be Empty");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid name(Min. 3 Character)");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                nameEditingController.text = value!;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: emailEditingController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Please Enter Your Email");
                                }
                                // reg expression for email validation
                                if (!RegExp(
                                        "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                    .hasMatch(value)) {
                                  return ("Please Enter a valid email");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                nameEditingController.text = value!;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: passwordEditingController,
                              obscureText: true,
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Password is required for login");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid Password(Min. 6 Character)");
                                }
                              },
                              onSaved: (value) {
                                nameEditingController.text = value!;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade400))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 50, top: 30, right: 50, bottom: 0),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      name = nameEditingController.text;
                                      email = emailEditingController.text;
                                      password = passwordEditingController.text;
                                    });
                                    register(emailEditingController.text, passwordEditingController.text);
                                  }
                                },
                                // defining the shape
                                color: Colors.purple.shade100,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void register(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password)
          .then((value) =>
      {
        postDetailsToFirestore()
      }).catchError((error) {
        if (error.code == 'weak-password') {
          print("Weak password");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.purple.shade200,
            content: Text("Weak password", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ));
        }
        else if (error.code == 'email-already-in-use') {
          print("Account is already exist");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.purple.shade200,
            content: Text("Account is already exist", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ));
        }
        else{
          print("Sign Up failed. Please try again.");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.purple.shade200,
            content: Text('Sign Up failed. Please try again.',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),);
        }
      });
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameEditingController.text;
    userModel.password = passwordEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());


    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => Mylogin()),
            (route) => false);
  }
}
