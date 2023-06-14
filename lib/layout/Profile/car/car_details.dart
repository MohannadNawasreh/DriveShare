import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:drive_share/layout/trips/cubit/cubit.dart';
import 'package:drive_share/layout/trips/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/Car.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});
  //final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripState>(
        listener: (context, state) {},
        builder: (context, state) {
                  var car  = TripsCubit.get(context).car;

          return ConditionalBuilder(
            condition: state is !UserInfoLoadingState,
            builder: (context) =>  Scaffold(
              appBar: AppBar(
                title: const Text('Car Info Details'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Car Model: ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  car.carmmodel.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Car Number : ',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  car.carmmodel.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Car Type :',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  car.cartype.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Text(
                                  'Car Year :',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                                Text(
                                  car.carmodel.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black38),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
  fallback  : (context) =>
                const Center(child: CircularProgressIndicator()),          );
        });
  }
}
