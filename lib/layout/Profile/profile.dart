import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/Profile/My-Ride/search-ride.dart';
import 'package:drive_share/layout/Profile/edit/search-edit.dart';
import 'package:drive_share/layout/trips/Find/trip_details_page.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/layout/Profile/car/car_details.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/planD/register_car_page.dart';
import 'package:drive_share/layout/Profile/car/search-car.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:drive_share/models/trip.dart';
import 'package:drive_share/teest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'edit/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PassengerGp passenger = PassengerGp(
    fname: 'fname',
    lname: 'lname',
    phonenumber: 'phonenumber',
    username: 'username',
    imagefile: 'imagefile',
  );

  String userName = "";
  String mobileNumber = "";
  String email = "";
  var _controller = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
//passenger.updateUserInfo(image: pickedImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {},
        builder: (context, state) {
          var userInfo = TripsCubit.get(context).UserInfo;
          return ConditionalBuilder(
            condition: state is! UserInfoLoadingState,
            builder: (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 3, 184, 78),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: _image != null
                                  ? Image.file(
                                      File(_image!.path),
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "images/Untitled-2.png",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 3, 184, 78),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${userInfo.fname}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${userInfo.fname} ${userInfo.lname}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 20),
                      ProfileMenuWidget(
                        passenger: userInfo,
                        icon: Icons.person,
                        text: "${userInfo.fname}",
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchEdit()),
                          );
                        },
                        icon2: null,
                      ),
                      ProfileMenuWidget(
                        passenger: userInfo,
                        icon: Icons.phone,
                        text: "${userInfo.phonenumber}",
                        textColor: Colors.black,
                        onPressed: () {},
                        icon2: null,
                      ),
                      ProfileMenuWidget(
                        passenger: userInfo,
                        icon: Icons.person,
                        text: "${userInfo.gender ?? 'Male'}",
                        textColor: Colors.black,
                        onPressed: () {},
                        icon2: null,
                      ),
                      ProfileMenuWidget(
                        passenger: passenger,
                        icon: Icons.start_rounded,
                        text: "My Ride",
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchMyRide()));
                        },
                        icon2: null,
                      ),
                      const Divider(),
                      ProfileMenuWidget(
                        passenger: passenger,
                        icon: Icons.payment,
                        text: "Become a Driver",
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchCar()),
                          );
                        },
                        icon2: null,
                      ),
                      ProfileMenuWidget(
                        passenger: passenger,
                        icon: Icons.logout,
                        text: "Logout",
                        textColor: Colors.black,
                        onPressed: () {
                          SignOut(context);
                        },
                        icon2: null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        });
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    required this.passenger,
    required this.icon,
    required this.text,
    this.textColor,
    required this.onPressed,
    required this.icon2,
  });

  final PassengerGp passenger;
  final IconData icon;
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  final IconData? icon2;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade300,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(text, style: TextStyle(color: textColor)),
      onTap: onPressed,
      trailing: Icon(icon2),
    );
  }
}
