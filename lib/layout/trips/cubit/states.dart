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

class RequestLoadingState extends TripState {}

class RequestInitialState extends TripState {}

class RequestSuccessState extends TripState {
}

class RequestErrorState extends TripState {
  late String error;
  RequestErrorState(this.error);
}