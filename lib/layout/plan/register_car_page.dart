import 'package:drive_share/layout/plan/plan_trip.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';

import '../../models/Car.dart';

class RegisterCar extends StatefulWidget {
  const RegisterCar({super.key});

  @override
  State<RegisterCar> createState() => _RegisterCarState();
}

class _RegisterCarState extends State<RegisterCar> {
  final TextEditingController carTypeController = TextEditingController();
  final TextEditingController carYearController = TextEditingController();
  final TextEditingController carModelController = TextEditingController();
  final TextEditingController carNumberController = TextEditingController();
  final TextEditingController imageLicenseController = TextEditingController();

  void registerCar() {
    final Car newCar = Car(
      CarType: carTypeController.text,
      CarYear: double.parse(carYearController.text),
      CarModel: carModelController.text,
      CarNumber: carNumberController.text,
      ImageLiecnse: imageLicenseController.text,
    );

    // Convert car object to JSON string
    final jsonString = newCar.toJsonString();
    print(
        jsonString); // Replace with your logic to send the data to a server or store it locally

    // Clear text fields
    carTypeController.clear();
    carYearController.clear();
    carModelController.clear();
    carNumberController.clear();
    imageLicenseController.clear();
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Center(
                    child: Image.asset("images/Untitled-2.png",
                        width: 100, height: 100)),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: carTypeController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(
                        Icons.car_crash_rounded,
                        size: 20,
                      ),
                      hintText: "Car Type",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Car Type cannot be empty";
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: carYearController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Car Year",
                      prefixIcon: const Icon(
                        Icons.car_crash,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Car Year cannot be empty";
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: carModelController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Car Model",
                      prefixIcon: const Icon(
                        Icons.car_crash_rounded,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Car Model cannot be empty";
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: carNumberController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Car Number",
                      prefixIcon: const Icon(
                        Icons.car_rental,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Car Number cannot be empty";
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: imageLicenseController,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 3, 184, 78)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Image License",
                      prefixIcon: const Icon(
                        Icons.document_scanner_outlined,
                        size: 20,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Image License cannot be empty";
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 20),
              largeButton(
                text: "Register Car",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Car car = Car(
                        CarType: carTypeController.text,
                        CarYear: double.parse(carYearController.text),
                        CarModel: carModelController.text,
                        CarNumber: carNumberController.text,
                        ImageLiecnse: imageLicenseController.text);

                    //carList.add(car as Map<String, dynamic>);
                       registerCars = true;


                 
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
