class City {
  int _id;
  String _city;

  City(dynamic obj) {
    _id = obj['id'];
    _city = obj['City'];
  }

  City.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _city = data['City'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'City': _city,
      };

  int get id => _id;
  String get city => _city;
}
