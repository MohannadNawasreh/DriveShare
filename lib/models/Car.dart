import 'dart:convert' show jsonEncode;
import 'package:image_picker/image_picker.dart';

class Car {
  double? CarId;
  String? CarType;
  int? CarYear;
  String? CarModel;
  String? CarNumber;
  XFile? ImageLicense;

  Car({
    required this.CarType,
    required this.CarYear,
    required this.CarModel,
    required this.CarNumber,
    this.ImageLicense,
    this.CarId,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      CarId: json['CarId'],
      CarType: json['CarType'],
      CarYear: json['CarYear'],
      CarModel: json['CarModel'],
      CarNumber: json['CarNumber'],
      ImageLicense:
          json['ImageLicense'], // Update the key based on your JSON structure
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CarId': CarId,
      'CarType': CarType,
      'CarYear': CarYear,
      'CarModel': CarModel,
      'CarNumber': CarNumber,
      'ImageLicense': ImageLicense, // Save the file path for the image
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  void updateCarInfo({
    String? CarModel,
    String? CarNumber,
    String? CarType,
    int? CarYear,
    XFile? ImageLicense,
  }) {
    this.CarModel = CarModel ?? this.CarModel;
    this.CarNumber = CarNumber ?? this.CarNumber;
    this.CarType = CarType ?? this.CarType;
    this.CarYear = CarYear ?? this.CarYear;
    this.ImageLicense = ImageLicense ?? this.ImageLicense;
  }
}
class CarGp {
  int? passengerid;
  String? fname;
  String? lname;
  String? phonenumber;
  String? gender;
  String? username;
  String? imagefile;
  String? carownerid;
  int? carid;
  String? cartype;
  int? carmodel;
  String? carmmodel;
  String? carnumber;
  String? imageliecnse;
  String? drivelicense;

  CarGp(
      {this.passengerid,
      this.fname,
      this.lname,
      this.phonenumber,
      this.gender,
      this.username,
      this.imagefile,
      this.carownerid,
      this.carid,
      this.cartype,
      this.carmodel,
      this.carmmodel,
      this.carnumber,
      this.imageliecnse,
      this.drivelicense});

  CarGp.fromJson(Map<String, dynamic> json) {
    passengerid = json['passengerid'];
    fname = json['fname'];
    lname = json['lname'];
    phonenumber = json['phonenumber'];
    gender = json['gender'];
    username = json['username'];
    imagefile = json['imagefile'];
    carownerid = json['carownerid'];
    carid = json['carid'];
    cartype = json['cartype'];
    carmodel = json['carmodel'];
    carmmodel = json['carmmodel'];
    carnumber = json['carnumber'];
    imageliecnse = json['imageliecnse'];
    drivelicense = json['drivelicense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passengerid'] = this.passengerid;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phonenumber'] = this.phonenumber;
    data['gender'] = this.gender;
    data['username'] = this.username;
    data['imagefile'] = this.imagefile;
    data['carownerid'] = this.carownerid;
    data['carid'] = this.carid;
    data['cartype'] = this.cartype;
    data['carmodel'] = this.carmodel;
    data['carmmodel'] = this.carmmodel;
    data['carnumber'] = this.carnumber;
    data['imageliecnse'] = this.imageliecnse;
    data['drivelicense'] = this.drivelicense;
    return data;
  }
}
