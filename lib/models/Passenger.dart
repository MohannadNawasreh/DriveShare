import 'package:image_picker/image_picker.dart';
/*
class Passenger {
  String? email;
  String? password;
  String? userName;
  String? phoneNumber;
  String? firstName;
  String? lastName;
  XFile? image;

  Passenger({
    required this.email,
    required this.password,
    this.userName,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.image,
  });

  void updateUserInfo({
    String? firstName,
    String? lastName,
    String? userName,
    String? email,
    String? phoneNumber,
    XFile? image,
  }) {
    this.email = email ?? this.email;
    this.userName = userName ?? this.userName;
    this.phoneNumber = phoneNumber ?? this.phoneNumber;
    this.firstName = firstName ?? this.firstName;
    this.lastName = lastName ?? this.lastName;
    this.image = image ?? this.image;
  }

  String getUserName() {
    return userName!;
  }

  String getEmail() {
    return email!;
  }

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      firstName: json['Fname'],
      userName: json['username'],
      email: json['email'],
      lastName: json['Lname'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }
}
*/
class PassengerGp {
  late final int? passengerid;
  late final String fname;
  late final String lname;
  late final String phonenumber;
  late final String username;
  late final String imagefile;
  late final int? carownerid;
  late final String? carowner;
  late final List<dynamic>? logingps;
  late final List<dynamic>? trippassengergps;

  PassengerGp({
    required this.fname,
    required this.lname,
    required this.phonenumber,
    required this.username,
    required this.imagefile,
    this.carownerid,
    this.carowner,
     this.logingps,
    this.trippassengergps,
    this.passengerid,

  });

  PassengerGp.fromJson(Map<String, dynamic> json) {
    passengerid = json['passengerid'];
    fname = json['fname'];
    lname = json['lname'];
    phonenumber = json['phonenumber'];
    username = json['username'];
    imagefile = json['imagefile'];
    carownerid = json['carownerid'];;
    carowner = json['carowner'];;
    logingps = List.castFrom<dynamic, dynamic>(json['logingps']);
    trippassengergps =
        List.castFrom<dynamic, dynamic>(json['trippassengergps']);
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
    return _data;
  }
}
