import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/trips/plan/car/car_details.dart';

import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../models/Car.dart';

class RegisterCar extends StatefulWidget {
  const RegisterCar({super.key});

  @override
  State<RegisterCar> createState() => _RegisterCarState();
}

class _RegisterCarState extends State<RegisterCar> {
  final formKey = GlobalKey<FormState>();

  TextEditingController carTypeController = TextEditingController();
  TextEditingController carYearController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carNumberController = TextEditingController();

  XFile? _selectedImage;
  bool _isImageSelected = false;
  bool isRegister = false;

  void _selectImage() async {
    if (_isImageSelected == true) {
      setState(() {
        _selectedImage = null;
        _isImageSelected = false;
        newCar.ImageLicense = null;
        isRegister = false;
      });
    } else {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _selectedImage = image;
        _isImageSelected = true;
        newCar.ImageLicense = _selectedImage;
        isRegister = true;
      });
    }
  }

  final Car newCar = Car(CarType: '', CarYear: 0, CarModel: '', CarNumber: '');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
        if (state is CarSuccessState) {
            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarDetails(
                                          car: newCar,
                                        )));
        }
      }, builder: (context, state) {
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
                      keyboardType: TextInputType.text,
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
                        if (value == null || value.isEmpty) {
                          return 'Please enter Car Type';
                        }
                        return null;
                      },
                      onSaved: (value) {
                         carTypeController = value as TextEditingController;
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
                      controller: carYearController,
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
                            newCar.CarYear = int.parse(value.toString());
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: carModelController,
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
                      controller: carNumberController,
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
                  ElevatedButton(
                    onPressed: _selectImage,
                    style: ElevatedButton.styleFrom(
                      primary: _isImageSelected
                          ? Color.fromARGB(255, 175, 210, 176)
                          : Colors.red,
                    ),
                    child: Text('Select Image License'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ConditionalBuilder(
                    condition: state is! CarLoadingState,
                    builder: (context) => largeButton(
                        text: 'Register Car',
                        onPressed: () async {
                          print('object');

                          if (formKey.currentState!.validate()) {
                            TripsCubit.get(context).CarRegister(
                                cartype: carTypeController.text,
                                carYearmodel: int.parse(carYearController.text),
                                carmmodel: carModelController.text,
                                carnumber: carNumberController.text);
                          }
                        }),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                  /*    largeButton(
                        text: 'Register Car',
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              _selectedImage != null) {
                            formKey.currentState!.save();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarDetails(
                                          car: newCar,
                                        )));
                            //  createTrip();
                            print(newCar.CarModel);
                            print(newCar.CarNumber);

                            print(newCar.CarType);

                            print(newCar.CarYear);
                          }
                        },
                      ),*/
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
