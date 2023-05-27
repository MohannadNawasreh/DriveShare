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
  final formKey = GlobalKey<FormState>();


  
   final Car newCar = Car(
      CarType: '',
      CarYear: 0,
      CarModel: '',
      CarNumber: '',
      ImageLiecnse: '',
    );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
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
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.name,
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
                    if (value == null || value.isEmpty) {
                      return 'Please enter Car Type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newCar.CarType = value;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 3, 184, 78)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.car_crash,
                      size: 20,
                    ),
                    hintText: "Car Year",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Car Year';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newCar.CarYear = double.parse(value.toString());
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.text,
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
                    hintText: "Car Model",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Car Model';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newCar.CarModel = value;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 3, 184, 78)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.description,
                      size: 20,
                    ),
                    hintText: "Car Number",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Car Number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newCar.CarNumber = value;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
 
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 3, 184, 78)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: const Icon(
                      Icons.document_scanner_outlined,
                      size: 20,
                    ),
                    hintText: "Image License",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Image License';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    newCar.ImageLiecnse = value;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              largeButton(
                text: 'Register Car',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    //  createTrip();
                    print(newCar.CarModel);
                    print(newCar.CarNumber);
                   
                    print(newCar.CarType);

                    print(newCar.CarYear);
                    print(newCar.ImageLiecnse);

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
