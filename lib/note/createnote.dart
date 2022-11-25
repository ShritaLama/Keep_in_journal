import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keepinjournal/note/style/app_style.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(
              12.0,
            ),
            child: Column(
              children: [
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        minLines: 2,
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                            hintText: "Enter Title",
                            hintStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            )),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        padding: const EdgeInsets.only(left: 12),
                        child: TextFormField(
                          controller: _descController,
                          decoration: InputDecoration.collapsed(
                            hintText: "Note Description",
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          maxLines: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final firestoreInstance  = FirebaseFirestore.instance;
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        CollectionReference users = firestoreInstance.collection("users");
                        users.doc(auth.currentUser?.uid).collection("notes").add({
                          "title": _titleController.text,
                          "desc": _descController.text,
                          "color_id": color_id

                        }).then((value) {
                          print(value.id);
                          Navigator.pop(context);
                        }).catchError((error) =>
                            print("Failed to add new Note due to $error"));
                        // if (_titleController.text.isEmpty &&
                        //     _descController.text.isEmpty) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Required title and description'),
                        //       duration: Duration(seconds: 2),
                        //     ),
                        //   );
                        //   //Navigator.pop(context);
                        //   return;
                        // } else {
                        //   print(_titleController.text);
                        //   print(_descController.text);
                        //
                        //
                        //   _titleController.clear();
                        //   _descController.clear();
                        //   Navigator.pop(context);
                        //   return;
                        // }
                      },

                      icon: Icon(Icons.save_alt_outlined),
                      label: const Text("Save"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        primary: Colors.deepPurpleAccent.shade100,
                      ),
                    ),
                  ],
                ),
              ],
                ),
            ),
          ),
        ),
      );
  }
}
