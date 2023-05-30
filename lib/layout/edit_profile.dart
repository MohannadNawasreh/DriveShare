import 'package:drive_share/layout/profile.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:drive_share/models/Passenger.dart';
import 'profile.dart';

import 'find_trip.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Passenger passenger = Passenger(
    email: "eyass123@gmail.com",
    password: "jhnljkn123",
    userName: "eyassBdair123",
    phoneNumber: "0123456789",
    firstName: "eyass",
    lastName: "bdair",
    image: null,
  );

  var _controller = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
 

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 184, 78),
      ),
      body: SafeArea(
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      passenger.userName!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 184, 78),
                      ),
                    ),
                    SizedBox(width: 10),
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
                SizedBox(height: 10),
                Text("${passenger.firstName} ${passenger.lastName}"),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passenger.updateUserInfo(
                                userName: _controller.text);
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
                    controller: _controller2,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passenger.updateUserInfo(
                                phoneNumber: _controller2.text);
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
                    controller: _controller3,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passenger.updateUserInfo(
                                userName: _controller3.text);
                          });
                        },
                        icon: Icon(Icons.done),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(passenger: passenger),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
