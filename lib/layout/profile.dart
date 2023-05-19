import 'package:drive_share/models/Passenger.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  Passenger passenger = Passenger(email: "eyass123@gmail.com", password: "jhnljkn123", userName: "eyassBdair123", phoneNumber: "0123456789",firstName: "eyass", lastName: "bdair");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/Untitled-2.png"),
              
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${passenger.userName}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 3, 184, 78)),),
                SizedBox(width: 10,),
                Text("4.5", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber[300]),),
                Icon(Icons.star_half_rounded, color: Colors.amber[300],),
              ],
            ),

            
            SizedBox(height: 20,),
            Text("${passenger.email}"),
            SizedBox(height: 20,),
            Text("${passenger.phoneNumber}"),
            SizedBox(height: 20,),
            
          ],
          
        ),
      ),
    );
  }
}