

class NoteModel{
  final int? id;
  final String? title;
  final String? subtitle;
  final String? time;
  final String? date;

  NoteModel({ this.id, required this.title, required this.subtitle,this.time,this.date});

  Map<String, dynamic> toMap(){
    return {
      "id":id,
      "title":title,
      "subtitle":subtitle,
      "time":time,
      "date":date,
    };
  }

  factory NoteModel.fromMap(Map<String,dynamic> map){
    return NoteModel(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      time: map['time'],
      date: map['date'],
    );
  }
}
