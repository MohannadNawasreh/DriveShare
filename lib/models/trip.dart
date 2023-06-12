class Trip {
  String? carOwnerName;
  int? seatNumber;
  String? startPoint;
  String? endPoint;
  String? description;
  DateTime? tripTime;
  String? priceTrip;
  double? Isactive;
  List<String>? Sp;

  Trip({
    required this.carOwnerName,
    required this.seatNumber,
    required this.startPoint,
    required this.endPoint,
    this.description,
    required this.tripTime,
    required this.priceTrip,
    this.Isactive,
    this.Sp,
  });
}

class TripGp {
  late final int tripid;
  late final String? startpoint;
  late final String? endpoint;
  late final int? rideprice;
  late final String triptime;
  late final int? seatnumber;
  late final String? descreption;
  late final int? isactive;
  late final int? carownerid;
  late final String? sp1;
  late final String? sp2;
  late final String? sp3;
  late final String? sp4;
  late final String? carowner;
  late final List<dynamic>? trippassengergps;

  TripGp.fromJson(Map<String, dynamic> json) {
    tripid = json['tripid'];
    startpoint = json['startpoint'];
    endpoint = json['endpoint'];
    rideprice = json['rideprice'];
    triptime = json['triptime'];
    seatnumber = json['seatnumber'];
    descreption = json['descreption'];
    isactive = json['isactive'];
    carownerid = json['carownerid'];
    sp1 = json['sp1'];
    sp2 = json['sp2'];
    sp3 = json['sp3'];
    sp4 = json['sp4'];
    carowner = json['carowner'];
    trippassengergps =
        List.castFrom<dynamic, dynamic>(json['trippassengergps']);
  }

  TripGp({
    required this.tripid,
    required this.startpoint,
    required this.endpoint,
    required this.rideprice,
    required this.triptime,
    required this.seatnumber,
    this.descreption,
    required this.isactive,
    required this.carownerid,
    this.sp1,
    this.sp2,
    this.sp3,
    this.sp4,
    this.carowner,
    this.trippassengergps,
  });

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tripid'] = tripid;
    _data['startpoint'] = startpoint;
    _data['endpoint'] = endpoint;
    _data['rideprice'] = rideprice;
    _data['triptime'] = triptime;
    _data['seatnumber'] = seatnumber;
    _data['descreption'] = descreption;
    _data['isactive'] = isactive;
    _data['carownerid'] = carownerid;
    _data['sp1'] = sp1;
    _data['sp2'] = sp2;
    _data['sp3'] = sp3;
    _data['sp4'] = sp4;
    _data['carowner'] = carowner;
    _data['trippassengergps'] = trippassengergps;
    return _data;
  }
}
