class RequestsPassenger {
  int? passengerid;
  String? fname;
  String? lname;
  String? phonenumber;
  String? username;
  String? imagefile;
  int? carownerid;
  int? tpid;
  int? request;
  int? tripid;
  int? rateid;
  bool? isStarted;

  RequestsPassenger(
      {this.passengerid,
      this.fname,
      this.lname,
      this.phonenumber,
      this.username,
      this.imagefile,
      this.carownerid,
      this.tpid,
      this.request,
      this.tripid,
      this.rateid,
      this.isStarted});

  RequestsPassenger.fromJson(Map<String, dynamic> json) {
    passengerid = json['passengerid'];
    fname = json['fname'];
    lname = json['lname'];
    phonenumber = json['phonenumber'];
    username = json['username'];
    imagefile = json['imagefile'];
    carownerid = json['carownerid'];
    tpid = json['tpid'];
    request = json['request'];
    tripid = json['tripid'];
    rateid = json['rateid'];
    isStarted = json['isStarted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passengerid'] = this.passengerid;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phonenumber'] = this.phonenumber;
    data['username'] = this.username;
    data['imagefile'] = this.imagefile;
    data['carownerid'] = this.carownerid;
    data['tpid'] = this.tpid;
    data['request'] = this.request;
    data['tripid'] = this.tripid;
    data['rateid'] = this.rateid;
    data['isStarted'] = this.isStarted;
    return data;
  }
}
