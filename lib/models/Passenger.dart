import 'package:image_picker/image_picker.dart';

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
