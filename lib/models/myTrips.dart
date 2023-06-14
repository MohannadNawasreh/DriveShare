class MyTrips {
  int? tripid;
  String? startpoint;
  String? endpoint;
  int? rideprice;
  String? triptime;
  int? seatnumber;
  String? descreption;
  int? isactive;
  int? carownerid;
  String? sp1;
  String? sp2;
  String? sp3;
  String? sp4;
  int? tpid;
  int? request;
  int? passengerid;
  int? rateid;
  int? isStarted;

  MyTrips(
      {this.tripid,
      this.startpoint,
      this.endpoint,
      this.rideprice,
      this.triptime,
      this.seatnumber,
      this.descreption,
      this.isactive,
      this.carownerid,
      this.sp1,
      this.sp2,
      this.sp3,
      this.sp4,
      this.tpid,
      this.request,
      this.passengerid,
      this.rateid,
      this.isStarted});

  MyTrips.fromJson(Map<String, dynamic> json) {
    tripid = json['tripid'];
    startpoint = json['startpoint'];
    endpoint = json['endpoint'];
    rideprice = json['rideprice'];
    triptime = json['triptime'];
    seatnumber = json['seatnumber'];
    descreption = json['descreption'];
    isactive = json['isactive'];
    carownerid = json['carownerid'];
    sp1 = json['sp1'];
    sp2 = json['sp2'];
    sp3 = json['sp3'];
    sp4 = json['sp4'];
    tpid = json['tpid'];
    request = json['request'];
    passengerid = json['passengerid'];
    rateid = json['rateid'];
    isStarted = json['isStarted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tripid'] = this.tripid;
    data['startpoint'] = this.startpoint;
    data['endpoint'] = this.endpoint;
    data['rideprice'] = this.rideprice;
    data['triptime'] = this.triptime;
    data['seatnumber'] = this.seatnumber;
    data['descreption'] = this.descreption;
    data['isactive'] = this.isactive;
    data['carownerid'] = this.carownerid;
    data['sp1'] = this.sp1;
    data['sp2'] = this.sp2;
    data['sp3'] = this.sp3;
    data['sp4'] = this.sp4;
    data['tpid'] = this.tpid;
    data['request'] = this.request;
    data['passengerid'] = this.passengerid;
    data['rateid'] = this.rateid;
    data['isStarted'] = this.isStarted;
    return data;
  }
}
