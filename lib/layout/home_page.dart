import 'package:drive_share/layout/plan_trip.dart';
import 'package:drive_share/layout/profile.dart';
import 'package:drive_share/models/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../providers/passanger_provider.dart';
import 'find_trip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screens = [
    FindTrip(),
    PlanTrip(),
    Profile(),
  ];
  List<String> titles = [
    "Find a trip",
    "Plan a trip",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    //final passengerProvider = Provider.of<PassengerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(
            backgroundImage: AssetImage('images/Untitled-2.png'),
            radius: 15,
          ),
          onPressed: () {
            Navigator.push(
              
              context,
              MaterialPageRoute(
                
                builder: (context) => Profile(),
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page_rounded),
            label: "Find a trip",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_rounded),
              label: "plan a trip"),
          
        ],
      ),
    );
  }
}
