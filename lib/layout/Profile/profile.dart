import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/Log/login_layout.dart';
import 'package:drive_share/layout/Profile/My-Ride/search-ride.dart';
import 'package:drive_share/layout/Profile/edit/search-edit.dart';
import 'package:drive_share/layout/home_page.dart';
import 'package:path_provider/path_provider.dart';

import 'package:drive_share/layout/trips/Find/trip_details_page.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/layout/Profile/car/car_details.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/planD/register_car_page.dart';
import 'package:drive_share/layout/Profile/car/search-car.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:drive_share/models/trip.dart';
import 'package:drive_share/network/remote/cache_helper.dart';
import 'package:drive_share/teest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  final _imagePathKey = 'profile_image_path';

  @override
  void initState() {
    super.initState();
    _loadImageFromPreferences();
  }

  Future<void> _loadImageFromPreferences() async {
    // _prefs = await SharedPreferences.getInstance();
    // final imagePath = _prefs.getString(_imagePathKey);
    final imagePath = CacheHelper.getData(key: 'profile_image_path');

    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }
  int DeletedId = int.parse(CacheHelper.getData(key: 'Passengerid').toString());

  Future<void> _pickImage() async {
   final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String imagePath = '${appDirectory.path}/profile_image.jpg';
      final File imageFile = File(pickedImage.path);

      // Copy the image file to the project folder
      await imageFile.copy(imagePath).toString();
      setState(() {
        _image = imageFile;
      });
      // _prefs.setString(_imagePathKey, imageFile.path);
      CacheHelper.saveData(key: 'profile_image_path' ,value: imageFile.path);
    }
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
                  icon: const Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
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
                                      CacheHelper.getData(
                                          key: 'profile_image_path')??'images/Untitled-2.png',
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
                        passenger: userInfo,
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
                        passenger: userInfo,
                        icon: Icons.payment,
                        text: "Become a Driver",
                        textColor: Colors.black,
                        onPressed: () {
                          if (CacheHelper.getData(key: 'carownerid') == '') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterCar()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchCar()),
                            );
                          }
                        },
                        icon2: null,
                      ),
                      ProfileMenuWidget(
                        passenger: userInfo,
                        icon: Icons.logout,
                        text: "Logout",
                        textColor: Color.fromARGB(255, 79, 78, 78),
                        onPressed: () {
                          SignOut(context);
                        },
                        icon2: null,
                      ),
                      ProfileMenuWidget(
                        passenger: userInfo,
                        icon: Icons.delete_forever_outlined,
                        text: "Delete User",
                        textColor: Colors.red,
                        onPressed: () {
//TripsCubit.get(context).DeleteUser();

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Deleted User",
                                    style: TextStyle(color: Colors.red)),
                                content: Text("Are you sure to delete?"),
                                actions: [
                                  smallButton(
                                      text: "Yes",
                                      onPressed: () async {
                                        print(DeletedId);
                                        var headers = {
                                          'Content-Type': 'application/json',
                                          'Cookie':
                                              'ARRAffinity=db7caaae5eca3babc5f5f4457fe724cbbbf257aeb4789bd12dc6351f9c66004b; ARRAffinitySameSite=db7caaae5eca3babc5f5f4457fe724cbbbf257aeb4789bd12dc6351f9c66004b'
                                        };
                                        var request = http.Request(
                                            'DELETE',
                                            Uri.parse(
                                                'https://driveshare.azurewebsites.net/api/User/deleteuser'));
                                        request.body = json
                                            .encode({"passengerid": DeletedId});
                                        request.headers.addAll(headers);

                                        http.StreamedResponse response =
                                            await request.send();

                                        if (response.statusCode == 200) {
                                          print(response.statusCode);
                                        } else {
                                          print(response.statusCode);
                                        }

                                        Fluttertoast.showToast(
                                            msg: "تم حذف حسابك بنجاح ",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 5,
                                            backgroundColor:
                                                Color.fromARGB(255, 3, 184, 78),
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        /*     Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginLayout()));*/
                                        SignOut(context);
                                      }),
                                  smallButton(
                                      text: "No",
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                ],
                              );
                            },
                          );
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
    this.backColor,
  });

  final PassengerGp passenger;
  final IconData icon;
  final String text;
  final Color? textColor;
  final VoidCallback? onPressed;
  final IconData? icon2;
  final Color? backColor;

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
