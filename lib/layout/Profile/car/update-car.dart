import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/Profile/car/search-car.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class UpdateCar extends StatefulWidget {
  const UpdateCar({super.key});

  @override
  State<UpdateCar> createState() => _UpdateCarState();
}

class _UpdateCarState extends State<UpdateCar> {
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
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TripsCubit(),
      child: BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
        if (state is TripPlanSuccessState) {
          Fluttertoast.showToast(
              msg: " تم تعديل المركبة بنجاح ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color.fromARGB(255, 3, 184, 78),
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchCar()));
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 3, 184, 78),
            title: const Text("Update Car"),
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
                          text: 'Update Car',
                          onPressed: () async {
                            print('object');

                            if (formKey.currentState!.validate()) {
                              TripsCubit.get(context).UpdateCar(
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
