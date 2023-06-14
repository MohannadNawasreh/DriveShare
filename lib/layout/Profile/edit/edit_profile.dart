import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/Profile/profile.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/layout/Profile/search.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:drive_share/teest.dart';
import 'package:flutter/material.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var firstNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripState>(listener: (context, state) {
      if (state is UpdateUserSuccessState) {
        Fluttertoast.showToast(
            msg: "Update User Success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: const Color.fromARGB(255, 3, 184, 78),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }, builder: (context, state) {
      var model = TripsCubit.get(context).UserInfo;
      firstNameController.text = model.fname.toString();
      phoneController.text = model.phonenumber.toString();
      emailController.text = model.username.toString();
      lastNameController.text = model.lname.toString();

      print(model.fname.toString() + 'ffffffffffffff');

      return ConditionalBuilder(
          condition: state is! UserInfoLoadingState,
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
          builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text('Edit Profile'),
                  backgroundColor: const Color.fromARGB(255, 3, 184, 78),
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage("images/Untitled-2.png"),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                model.fname.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 3, 184, 78),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[300],
                                ),
                              ),
                              Icon(
                                Icons.star_half_rounded,
                                color: Colors.amber[300],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text("${model.fname} ${model.lname}"),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: TextFormField(
                              controller: phoneController,
                              decoration: const InputDecoration(
                                label: Text('Phone Number'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                label: Text('Email'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: const InputDecoration(
                                label: Text('First Name'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: TextFormField(
                              controller: lastNameController,
                              decoration: const InputDecoration(
                                label: Text('Last Name'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ConditionalBuilder(
                              condition: state is! UpdateUserLoadingState,
                              builder: (context) => largeButton(
                                  text: 'Update User',
                                  onPressed: () async {
                                    TripsCubit.get(context).UpdateUser(
                                      phoneNumber: phoneController.text,
                                      email: emailController.text,
                                      userName: emailController.text,
                                      fName: firstNameController.text,
                                      lName: lastNameController.text,
                                      imageFile: model.imagefile.toString(),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SearchProfile()),
                                    );
                                  }),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
    });
  }
}
