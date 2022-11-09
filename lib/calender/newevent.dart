import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class NewEvent extends StatefulWidget {
  const NewEvent({Key? key}) : super(key: key);

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  Map<String, List> mySelectedEvents = {};
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(12.0,),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: titleController,
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
                                controller: descpController,
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
                            onPressed: () async{
                              if (titleController.text.isEmpty &&
                                  descpController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Required title and description'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                //Navigator.pop(context);
                                return;
                              } else {
                                print(titleController.text);
                                print(descpController.text);

                                setState(() {
                                  if (mySelectedEvents[
                                  DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
                                      null) {
                                    mySelectedEvents[
                                    DateFormat('yyyy-MM-dd').format(_selectedDate!)]
                                        ?.add({
                                      "eventTitle": titleController.text,
                                      "eventDescp": descpController.text,
                                    });
                                  } else {
                                    mySelectedEvents[
                                    DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                                      {
                                        "eventTitle": titleController.text,
                                        "eventDescp": descpController.text,
                                      }
                                    ];
                                  }
                                });

                                print(
                                    "New Event for backend developer ${json.encode(mySelectedEvents)}");
                                titleController.clear();
                                descpController.clear();
                                Navigator.pop(context);
                                return;
                              }
                            },
                            icon: Icon(Icons.save_alt_outlined,  size: 20,),
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
                )
            )
        )
    );
  }
}
