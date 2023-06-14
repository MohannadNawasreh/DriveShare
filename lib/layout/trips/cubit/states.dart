abstract class TripState {}

class TripsInitialState extends TripState {}

class TripPlanSuccessState extends TripState {}

class TripPlanErrorState extends TripState {
  late String error;
  TripPlanErrorState(this.error);
}

class TripPlanLoadingState extends TripState {}


/////////////////////
///
///
///

class UserInfoSuccessState extends TripState {}

class UserInfoErrorState extends TripState {
  late String error;
  UserInfoErrorState(this.error);
}

class UserInfoLoadingState extends TripState {}


//class CarOwnerTripsInitialState extends TripState {}

class CarOwnerTripsSuccessState extends TripState {}

class CarOwnerTripsErrorState extends TripState {
  late String error;
  CarOwnerTripsErrorState(this.error);
}

class CarOwnerTripsLoadingState extends TripState {}

class RequestLoadingState extends TripState {}


class RequestSuccessState extends TripState {
}

class RequestErrorState extends TripState {
  late String error;
  RequestErrorState(this.error);
}




class UpdateUserLoadingState extends TripState {}


class UpdateUserSuccessState extends TripState {
}

class UpdateUserErrorState extends TripState {
  late String error;
  UpdateUserErrorState(this.error);
}