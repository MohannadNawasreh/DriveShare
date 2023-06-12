import 'dart:io';

import 'package:drive_share/layout/my_ride.dart';
import 'package:drive_share/layout/Find/trip_details_page.dart';
import 'package:drive_share/layout/trips/plan/car/register_car_page.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:drive_share/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'edit_profile.dart';

class Profile extends StatefulWidget {
  final PassengerGp passenger;

  const Profile({
    required this.passenger,
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
      email: 'email');

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
    return Scaffold(
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
                "${passenger.username}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${passenger.fname} ${passenger.lname}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfile(),
                      ),
                    );
                  },
                  child: const Text("Edit Profile"),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 3, 184, 78),
                    onPrimary: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              ProfileMenuWidget(
                passenger: passenger,
                icon: Icons.person,
                text: "${passenger.username}",
                textColor: Colors.black,
                onPressed: () {},
                icon2: null,
              ),
              ProfileMenuWidget(
                passenger: passenger,
                icon: Icons.phone,
                text: "${passenger.phonenumber}",
                textColor: Colors.black,
                onPressed: () {},
                icon2: null,
              ),
              ProfileMenuWidget(
                passenger: passenger,
                icon: Icons.person,
                text: "${passenger.email}",
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
                  context, MaterialPageRoute(builder: (context) => MyRide( trip: TripGp(tripid: 12314123, startpoint: "شارع الأردن", endpoint: "endpoint", rideprice: 200 , triptime: "10:00:00", seatnumber: 3 , isactive: 0, carownerid: 1234), index: 1,)),
                  );
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
                    context, MaterialPageRoute(builder: (context) => RegisterCar()),
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

                },
                icon2: null,
              ),
            ],
          ),
        ),
      ),
    );
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


/*       body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/Untitled-2.png"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _controller.text,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 3, 184, 78)),
                          
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[300]),
                    ),
                    Icon(
                      Icons.star_half_rounded,
                      color: Colors.amber[300],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${passenger.firstName} ${passenger.lastName}"),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    initialValue: "${passenger.email}",
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          passenger.userName = _controller3.text;
                          setState(() {
                            passenger.userName = _controller3.text;
                          });
                        },
                        icon: Icon(Icons.done),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    initialValue: "${passenger.phoneNumber}",
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          passenger.userName = _controller2.text;
                          setState(() {
                            passenger.userName = _controller2.text;
                          });
                        },
                        icon: Icon(Icons.done),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    initialValue: "${passenger.userName}",
                    
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          _controller.value = TextEditingValue(
                            
                            text: "${passenger.userName}",
                          );
                          passenger.userName = _controller.text;
                          setState(() {
                            passenger.userName = _controller.text;
                            
                          });

                        },
                        icon: Icon(Icons.done),
                      ),
                      ),

                    ),
                    
                    
                  ),
                
              ],
            ),
          ),
        ),
      ), */