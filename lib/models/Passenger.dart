import 'package:image_picker/image_picker.dart';

class PassengerGp {
  int? passengerid;
  String? fname;
  String? lname;
  String? phonenumber;
  String? username;
  String? imagefile;
  int? carownerid;
  String? gender;
  String? carowner;
  List<dynamic>? logingps;
  List<dynamic>? trippassengergps;

  PassengerGp(
      {this.passengerid,
      this.fname,
      this.lname,
      this.phonenumber,
      this.username,
      this.imagefile,
      this.carownerid,
      this.gender,
      this.carowner,
      this.logingps,
      this.trippassengergps});

  PassengerGp.fromJson(Map<String, dynamic> json) {
    passengerid = json['passengerid'];
    fname = json['fname'];
    lname = json['lname'];
    phonenumber = json['phonenumber'];
    username = json['username'];
    imagefile = json['imagefile'];
    carownerid = json['carownerid'];
    carowner = json['carowner'];
    logingps = List.castFrom<dynamic, dynamic>(json['logingps']);
    trippassengergps =
        List.castFrom<dynamic, dynamic>(json['trippassengergps']);
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['passengerid'] = passengerid;
    _data['fname'] = fname;
    _data['lname'] = lname;
    _data['phonenumber'] = phonenumber;
    _data['username'] = username;
    _data['imagefile'] = imagefile;
    _data['carownerid'] = carownerid;
    _data['carowner'] = carowner;
    _data['logingps'] = logingps;
    _data['trippassengergps'] = trippassengergps;
    _data['gender'] = gender;

    return _data;
  }
}
