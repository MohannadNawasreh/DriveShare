import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drive_share/models/Passenger.dart';

class PassengerProvider extends ChangeNotifier {
  Passenger? _passenger;

  Passenger? get passenger => _passenger;

  void login(String email, String password) {
    // Perform login logic and set the user object
    _passenger = Passenger(email: email, password: password);
    notifyListeners();
  }

  void signup(  String firstName, String lastName, String email, String password, String phoneNumber,String userName) {
    // Perform signup logic and set the user object
    _passenger = Passenger( firstName: firstName, lastName: lastName, email: email, password: password, phoneNumber: phoneNumber,userName: userName);
    notifyListeners();
  }

  void logout() {
    // Clear the user object
    _passenger = null;
    notifyListeners();
  }
}
