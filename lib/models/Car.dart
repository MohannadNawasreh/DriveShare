// ignore: file_names
import 'dart:convert' show jsonEncode;

class Car {
  double? CarId;
  String? CarType;
  double? CarYear;
  String? CarModel;
  String? CarNumber;
  String? ImageLiecnse;

  Car(
      {required this.CarType,
      required this.CarYear,
      required this.CarModel,
      required this.CarNumber,
      required this.ImageLiecnse,
      this.CarId});


  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      CarId: json['CarId'],
      CarType: json['CarType'],
      CarYear: json['CarYear'],
      CarModel: json['CarModel'],
      CarNumber: json['CarNumber'],
      ImageLiecnse: json['ImageLicense'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CarId': CarId,
      'CarType': CarType,
      'CarYear': CarYear,
      'CarModel': CarModel,
      'CarNumber': CarNumber,
      'ImageLicense': ImageLiecnse,
    };
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}


