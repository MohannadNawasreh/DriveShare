import 'package:drive_share/layout/trips/plan/tripPlan/planD/register_car_page.dart';
import 'package:drive_share/layout/Profile/profile.dart';
import 'package:drive_share/layout/Profile/car/search-car.dart';
import 'package:drive_share/layout/Profile/search.dart';
import 'package:drive_share/layout/trips/plan/tripPlan/planD/loading-page.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:flutter/material.dart';

import 'package:drive_share/layout/trips/plan/tripPlan/planD/plan_trip.dart';

import 'trips/Find/find_trip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const FindTrip(),
     LoadingPage(),
    //const RegisterCar(),
  ];
  List<String> titles = [
    "Find a trip",
    "Plan a trip",
    //"Register a Car",
  ];

  @override
  Widget build(BuildContext context) {
    //final passengerProvider = Provider.of<PassengerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 184, 78),
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundImage: AssetImage('images/Untitled-2.png'),
            radius: 15,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => SearchProfile()//Profile(passenger:PassengerGp(fname: 'fname', lname: 'lname', phonenumber: 'phonenumber', username: 'username', imagefile: 'imagefile') ),
              ),
            );
          },
        ),
        title: Text(titles[currentIndex]),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page_rounded),
            label: "Find a trip",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_rounded), label: "plan a trip"),
          //BottomNavigationBarItem(
              //icon: Icon(Icons.car_crash), label: "Register a Car"),
        ],
      ),
    );
  }
}
