abstract class TripState {}

class TripPlanInitialState extends TripState {}

class TripPlanSuccessState extends TripState {}

class TripPlanErrorState extends TripState {
  late String error;
  TripPlanErrorState(this.error);
}

class TripPlanLoadingState extends TripState {}



class CarOwnerTripsInitialState extends TripState {}

class CarOwnerTripsSuccessState extends TripState {}

class CarOwnerTripsErrorState extends TripState {
  late String error;
  CarOwnerTripsErrorState(this.error);
}

class CarOwnerTripsLoadingState extends TripState {}