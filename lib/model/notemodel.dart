import 'package:cloud_firestore/cloud_firestore.dart';

class noteModel {
  String? id;
  String? title;
  String? desc;
  String? color_id;

  noteModel({this.title, this.desc, this.color_id});

  // receiving data from server

  noteModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot["id"];
    title = documentSnapshot['title'];
   desc = documentSnapshot["desc"];

  }
  // factory noteModel.fromMap(map) {
  //   return noteModel(
  //       title: map['title'],
  //       desc: map['desc'],
  //      color_id: map ['color_id']
  //   );
  // }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'color_id': color_id,
    };
  }
}