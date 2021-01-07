class Prices {
  int _gradeId;
  int _monthPrice;
  int _note1Price;
  int _note2Price;

  Prices(dynamic obj) {
    _gradeId = obj['gradeId'];
    _monthPrice = obj['monthPrice'];
    _note1Price = obj['note1Price'];
    _note2Price = obj['note2Price'];
  }

  Prices.fromMap(Map<String, dynamic> data) {
    _gradeId = data['gradeId'];
    _monthPrice = data['monthPrice'];
    _note1Price = data['note1Price'];
    _note2Price = data['note2Price'];
  }

  Map<String, dynamic> toMap() => {
        'gradeId': _gradeId,
        'monthPrice': _monthPrice,
        'note1Price': _note1Price,
        'note2Price': _note2Price,
      };

  int get gradeId => _gradeId;
  int get monthPrice => _monthPrice;
  int get note1Price => _note1Price;
  int get note2Price => _note2Price;
}
