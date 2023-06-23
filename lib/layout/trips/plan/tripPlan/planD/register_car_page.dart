import 'dart:convert';
import 'dart:io';
import 'package:drive_share/models/Passenger.dart';
import 'package:http/http.dart' as http;

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/home_page.dart';

import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<void> _uploadImage() async {
    if (_selectedImage != null) {
      try {
        final passenger = await uploadFile(File(_selectedImage!.path));
        // Handle the response from the server or perform any necessary actions
        if (passenger != null) {
          print('object');
        } else {
          print('lllllllllll');
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  void _selectImage() async {
    if (_isImageSelected) {
      setState(() {
        _selectedImage = null;
        _isImageSelected = false;
        isRegister = false;
      });
    } else {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _selectedImage = image;
        _isImageSelected = true;
        isRegister = true;
      });

      await _uploadImage(); // Call the uploadImage method after selecting the image
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
        if (state is TripPlanSuccessState) {
          Fluttertoast.showToast(
              msg: " تم تسجيل المركبة بنجاح ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 3, 184, 78),
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            backgroundColor: const Color.fromARGB(255, 3, 184, 78),
            title: const Text("Register Car"),
          ),
          body: Padding(
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
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: _selectImage,
                      style: ElevatedButton.styleFrom(
                        primary: _isImageSelected
                            ? const Color.fromARGB(255, 175, 210, 176)
                            : Colors.red,
                      ),
                      child: const Text('Select Image License'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(
                      condition: state is! TripPlanLoadingState,
                      builder: (context) => largeButton(
                          text: 'Register Car',
                          onPressed: () async {
                      /*      final passenger =
                                await uploadFile(File(_selectedImage!.path));
                            print('pppppppppppppp');*/


                            if (formKey.currentState!.validate()) {
                              TripsCubit.get(context).CarRegister(
                                  cartype: carTypeController.text,
                                  carYearmodel:
                                      int.parse(carYearController.text),
                                  carmmodel: carModelController.text,
                                  carnumber: carNumberController.text);
                            }
                          }),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class PassengerDTO {
  final String imagefile;

  PassengerDTO({required this.imagefile});

  factory PassengerDTO.fromJson(Map<String, dynamic> json) {
    return PassengerDTO(
      imagefile: json['imagefile'],
    );
  }
}

Future<PassengerGp?> uploadFile(File file) async {

  var headers = {
  'Cookie': 'ARRAffinity=db7caaae5eca3babc5f5f4457fe724cbbbf257aeb4789bd12dc6351f9c66004b; ARRAffinitySameSite=db7caaae5eca3babc5f5f4457fe724cbbbf257aeb4789bd12dc6351f9c66004b'
};
var request = http.MultipartRequest('POST', Uri.parse('https://driveshare.azurewebsites.net/api/User/uploadfile'));
  request.files.add(await http.MultipartFile.fromPath('file', file.path));
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
  print(response.statusCode);

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
    print(response.statusCode);

}

  /*var request = http.MultipartRequest('POST',
      Uri.parse('https://driveshare.azurewebsites.net/api/User/uploadfile'));
  request.files.add(await http.MultipartFile.fromPath('file', file.path));

  var response = await request.send();
  print(response.statusCode);
  if (response.statusCode == 200) {
    var responseString = await response.stream.bytesToString();
    var passenger = PassengerGp.fromJson(json.decode(responseString));
    print('lllllllllllllllllllkkkkkkkkkkkkkkkkkkkkkkk');
    return passenger;
  } else {
    print('lllllllllllllllllllkkkkkkkkkkkkkkkkkkkkkkk');

    return null;
  }*/
}
