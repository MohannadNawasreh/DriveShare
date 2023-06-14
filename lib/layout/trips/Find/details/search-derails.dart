import 'package:drive_share/layout/trips/Find/details/ttt.dart';
import 'package:drive_share/layout/trips/Find/trip_details_page.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:drive_share/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDetails extends StatelessWidget {
  final TripGp trip;
  final int index;
    final int carownerid;


  const SearchDetails({
    super.key,
    required this.trip,
    required this.index, required this.carownerid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..GetCarownerInfo(carownerid: carownerid),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {
       /*   if (state is UserInfoSuccessState) {
              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => www(
                       index: index,
              trip: trip,
                    )),
                  );

          }*/
        },
        builder: (context, state) {
          return  Scaffold(
            /*      appBar: AppBar(
              title: const Text('Test Trip'),
            ),
        */
            body: www(
                       index: index,
              trip: trip,
                    ),
            /*    bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (value) {
                  cubit.changeBottomNavBar(value);
                },
                items: cubit.bottomItems),*/
          );
        },
      ),
    );
  }
}
