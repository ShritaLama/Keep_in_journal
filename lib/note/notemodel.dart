class NoteModel {
  String? note_title;
  String? note_content;
  String? color_id;

  NoteModel({this.note_title, this.note_content, this.color_id});

  // receiving data from server
  factory NoteModel.fromMap(map) {
    return NoteModel(
       note_title: map['note_title'],
       note_content: map['note_content'],
       color_id: map['color_id'],

    );
  }
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'note_tile': note_title,
      'note_content': note_content,
      'color_id': color_id,
    };
  }
}