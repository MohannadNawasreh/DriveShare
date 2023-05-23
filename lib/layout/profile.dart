import 'package:drive_share/models/Passenger.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Passenger passenger = Passenger(
      email: "eyass123@gmail.com",
      password: "jhnljkn123",
      userName: "eyassBdair123",
      phoneNumber: "0123456789",
      firstName: "eyass",
      lastName: "bdair");
      String userName = "";
      String mobileNumber = "";
      String email = "";
  var _controller = TextEditingController();
  var _controller2 = TextEditingController();
  var _controller3 = TextEditingController();
  
  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
    );
  }
}
