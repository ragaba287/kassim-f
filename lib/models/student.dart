class Student {
  int _studentId;
  String _studentName;
  int _studentPhone;
  String _studentCity;
  int _studentGrade;
  int _month1;
  int _month2;
  int _month3;
  int _month4;
  int _month5;
  int _month6;
  int _month7;
  int _month8;
  int _month9;
  int _month10;
  int _month11;
  int _month12;
  int _note1;
  int _note2;

  Student(dynamic obj) {
    _studentId = obj['studentId'];
    _studentName = obj['studentName'];
    _studentPhone = obj['studentPhone'];
    _studentCity = obj['studentCity'];
    _studentGrade = obj['studentGrade'];
    _month1 = obj['month1'];
    _month2 = obj['month2'];
    _month3 = obj['month3'];
    _month4 = obj['month4'];
    _month5 = obj['month5'];
    _month6 = obj['month6'];
    _month7 = obj['month7'];
    _month8 = obj['month8'];
    _month9 = obj['month9'];
    _month10 = obj['month10'];
    _month11 = obj['month11'];
    _month12 = obj['month12'];
    _note1 = obj['note1'];
    _note2 = obj['note2'];
  }

  Student.fromMap(Map<String, dynamic> data) {
    _studentId = data['studentId'];
    _studentName = data['studentName'];
    _studentPhone = data['studentPhone'];
    _studentCity = data['studentCity'];
    _studentGrade = data['studentGrade'];
    _month1 = data['month1'];
    _month2 = data['month2'];
    _month3 = data['month3'];
    _month4 = data['month4'];
    _month5 = data['month5'];
    _month6 = data['month6'];
    _month7 = data['month7'];
    _month8 = data['month8'];
    _month9 = data['month9'];
    _month10 = data['month10'];
    _month11 = data['month11'];
    _month12 = data['month12'];
    _note1 = data['note1'];
    _note2 = data['note2'];
  }

  Map<String, dynamic> toMap() => {
        'studentId': _studentId,
        'studentName': _studentName,
        'studentPhone': _studentPhone,
        'studentCity': _studentCity,
        'studentGrade': _studentGrade,
        'month1': _month1,
        'month2': _month2,
        'month3': _month3,
        'month4': _month4,
        'month5': _month5,
        'month6': _month6,
        'month7': _month7,
        'month8': _month8,
        'month9': _month9,
        'month10': _month10,
        'month11': _month11,
        'month12': _month12,
        'note1': _note1,
        'note2': _note2,
      };

  int get studentId => _studentId;
  String get studentName => _studentName;
  int get studentPhone => _studentPhone;
  String get studentCity => _studentCity;
  int get studentGrade => _studentGrade;
  int get month1 => _month1;
  int get month2 => _month2;
  int get month3 => _month3;
  int get month4 => _month4;
  int get month5 => _month5;
  int get month6 => _month6;
  int get month7 => _month7;
  int get month8 => _month8;
  int get month9 => _month9;
  int get month10 => _month10;
  int get month11 => _month11;
  int get month12 => _month12;
  int get note1 => _note1;
  int get note2 => _note2;
}
