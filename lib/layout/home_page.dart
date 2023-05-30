import 'package:drive_share/layout/plan/plan_trip.dart';
import 'package:drive_share/layout/plan/register_car_page.dart';
import 'package:drive_share/layout/profile.dart';
import 'package:drive_share/models/Passenger.dart';
import 'package:flutter/material.dart';



import 'find_trip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screens = [
    const FindTrip(),
    const PlanTrip(),
    const RegisterCar(),
  ];
  List<String> titles = [
    "Find a trip",
    "Plan a trip",
    "Register a Car",
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
              builder: (context) =>  Profile(passenger: Passenger( email: "eyass123@gmail.com", password: "jhnljkn123", userName: "eyassBdair123", phoneNumber: "0123456789", firstName: "eyass", lastName: "bdair"),),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.car_crash), label: "Register a Car"),
        ],
      ),
    );
  }
}
