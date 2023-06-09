import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Test_Dio extends StatelessWidget {
  const Test_Dio({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsCubit()..getAllListTrips(),
      child: BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TripsCubit.get(context);
          return Scaffold(
            /*      appBar: AppBar(
              title: const Text('Test Trip'),
            ),
        */
            body: cubit.screens[cubit.currentIndex],
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
