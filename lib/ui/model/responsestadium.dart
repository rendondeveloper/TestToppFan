/// rows : [{"name":"Y","row_id":25,"seats":{"start":"18","total":"15","on_hold":[],"on_hold_sale":["1","2","3","4","5","6","7","9","10","13"],"skip_seats":[]}},{"name":"X","row_id":24,"seats":{"start":"1","total":"32","on_hold":[],"on_hold_sale":["1","2","3","4","5","6","7","9","10","12","13","14","15","18","19","20"],"skip_seats":[]}},{"name":"W","row_id":23,"seats":{"start":"1","total":"32","on_hold":[],"on_hold_sale":["1","2","3","4","5","7","8","26"],"skip_seats":[]}},{"name":"V","row_id":22,"seats":{"start":"1","total":"32","on_hold":[],"on_hold_sale":["1","2","3","4","7","8","26","27"],"skip_seats":[]}},{"name":"U","row_id":21,"seats":{"start":"2","total":"31","on_hold":[],"on_hold_sale":["1","2","3","6","7"],"skip_seats":[]}},{"name":"T","row_id":20,"seats":{"start":"2","total":"31","on_hold":[],"on_hold_sale":["1","2","3","4","6","7"],"skip_seats":[]}},{"name":"S","row_id":19,"seats":{"start":"3","total":"30","on_hold":[],"on_hold_sale":["1","2","3","4","5","6"],"skip_seats":[]}},{"name":"R","row_id":18,"seats":{"start":"3","total":"30","on_hold":[],"on_hold_sale":["1","2","3","4","5","6","13"],"skip_seats":[]}},{"name":"Q","row_id":17,"seats":{"start":"3","total":"30","on_hold":[],"on_hold_sale":["1","2","3","4","5","6","13"],"skip_seats":[]}},{"name":"P","row_id":16,"seats":{"start":"4","total":"29","on_hold":[],"on_hold_sale":["1","2","3","4","14","15","17","18"],"skip_seats":[]}},{"name":"O","row_id":15,"seats":{"start":"4","total":"29","on_hold":[],"on_hold_sale":["1","2","3","14","15"],"skip_seats":[]}},{"name":"N","row_id":14,"seats":{"start":"5","total":"28","on_hold":[],"on_hold_sale":["1","2","13","14","15","16"],"skip_seats":[]}},{"name":"M","row_id":13,"seats":{"start":"5","total":"28","on_hold":[],"on_hold_sale":["1"],"skip_seats":[]}},{"name":"L","row_id":12,"seats":{"start":"6","total":"27","on_hold":[],"on_hold_sale":["1","12","13","14","15"],"skip_seats":[]}},{"name":"K","row_id":11,"seats":{"start":"6","total":"27","on_hold":[],"on_hold_sale":["1","2"],"skip_seats":[]}},{"name":"J","row_id":10,"seats":{"start":"7","total":"26","on_hold":[],"on_hold_sale":["1"],"skip_seats":[]}},{"name":"I","row_id":9,"seats":{"start":"7","total":"26","on_hold":[],"on_hold_sale":["1","18","21","22"],"skip_seats":[]}},{"name":"H","row_id":8,"seats":{"start":"8","total":"25","on_hold":[],"on_hold_sale":["16","17","18","19"],"skip_seats":[]}},{"name":"G","row_id":7,"seats":{"start":"8","total":"25","on_hold":[],"on_hold_sale":["2"],"skip_seats":[]}},{"name":"F","row_id":6,"seats":{"start":"9","total":"24","on_hold":[],"on_hold_sale":[],"skip_seats":[]}},{"name":"E","row_id":5,"seats":{"start":"10","total":"23","on_hold":[],"on_hold_sale":["1","2"],"skip_seats":[]}},{"name":"D","row_id":4,"seats":{"start":"10","total":"23","on_hold":[],"on_hold_sale":["1","2"],"skip_seats":[]}},{"name":"C","row_id":3,"seats":{"start":"11","total":"22","on_hold":[],"on_hold_sale":["1","2"],"skip_seats":[]}},{"name":"B","row_id":2,"seats":{"start":"11","total":"22","on_hold":[],"on_hold_sale":["1","2","21"],"skip_seats":[]}},{"name":"A","row_id":1,"seats":{"start":"12","total":"21","on_hold":[],"on_hold_sale":["1","2","6","7","19","20","21"],"skip_seats":[]}}]
class StadiumModel {
  List<Rows> _rows;

  List<Rows> get rows => _rows;

  StadiumModel({
      List<Rows> rows}){
    _rows = rows;
}

  StadiumModel.fromJson(dynamic json) {
    if (json["rows"] != null) {
      _rows = [];
      json["rows"].forEach((v) {
        _rows.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_rows != null) {
      map["rows"] = _rows.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Y"
/// row_id : 25
/// seats : {"start":"18","total":"15","on_hold":[],"on_hold_sale":["1","2","3","4","5","6","7","9","10","13"],"skip_seats":[]}

class Rows {
  String _name;
  int _rowId;
  Seats _seats;

  String get name => _name;
  int get rowId => _rowId;
  Seats get seats => _seats;

  Rows({
      String name, 
      int rowId, 
      Seats seats}){
    _name = name;
    _rowId = rowId;
    _seats = seats;
}

  Rows.fromJson(dynamic json) {
    _name = json["name"];
    _rowId = json["row_id"];
    _seats = json["seats"] != null ? Seats.fromJson(json["seats"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["row_id"] = _rowId;
    if (_seats != null) {
      map["seats"] = _seats.toJson();
    }
    return map;
  }

}

/// start : "18"
/// total : "15"
/// on_hold : []
/// on_hold_sale : ["1","2","3","4","5","6","7","9","10","13"]
/// skip_seats : []

class Seats {
  int _start;
  int _total;
  List<dynamic> _onHold;
  List<String> _onHoldSale;
  List<dynamic> _skipSeats;

  int get start => _start;
  int get total => _total;
  List<dynamic> get onHold => _onHold;
  List<String> get onHoldSale => _onHoldSale;
  List<dynamic> get skipSeats => _skipSeats;

  Seats({
      int start,
      int total,
      List<dynamic> onHold, 
      List<String> onHoldSale,
      List<dynamic> skipSeats}){
    _start = start;
    _total = total;
    _onHold = onHold;
    _onHoldSale = onHoldSale;
    _skipSeats = skipSeats;
}

  Seats.fromJson(dynamic json) {
    _start = int.parse(json["start"].toString());
    _total = int.parse(json["total"].toString());
    if (json["on_hold"] != null) {
      _onHold = [];
      json["on_hold"].forEach((v) {
        _onHold.add(json.fromJson(v));
      });
    }
    _onHoldSale = json["on_hold_sale"] != null ? json["on_hold_sale"].cast<String>() : [];
    if (json["skip_seats"] != null) {
      _skipSeats = [];
      json["skip_seats"].forEach((v) {
        _skipSeats.add(json.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["start"] = _start;
    map["total"] = _total;
    if (_onHold != null) {
      map["on_hold"] = _onHold.map((v) => v.toJson()).toList();
    }
    map["on_hold_sale"] = _onHoldSale;
    if (_skipSeats != null) {
      map["skip_seats"] = _skipSeats.map((v) => v.toJson()).toList();
    }
    return map;
  }
}