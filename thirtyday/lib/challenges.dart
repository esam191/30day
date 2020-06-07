import 'dart:ui';

class Note {

  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;
  bool _isChecked = false;
  Color _color; //Color.fromRGBO(231, 129, 109, 1.0);
  Note(this._title, this._date, this._priority, this._isChecked, [this._description]);

  Note.withId(this._id, this._title, this._date, this._priority, this._isChecked, [this._description]);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  int get priority => _priority;

  String get date => _date;

  bool get isChecked => _isChecked;
  
  Color get cardColor => _color;

  set cardColor(Color c){
    this._color = c;
  }
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }
  set isChecked(bool isCheck){
    this._isChecked = isCheck;
  }
  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}