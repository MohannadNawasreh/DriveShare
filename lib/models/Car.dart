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



/*
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
*/

