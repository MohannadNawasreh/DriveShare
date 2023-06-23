class CarGp {
  int? passengerid;
  String? fname;
  String? lname;
  String? phonenumber;
  String? gender;
  String? username;
  String? imagefile;
  String? carownerid;
  int? carid;
  String? cartype;
  int? carmodel;
  String? carmmodel;
  String? carnumber;
  String? imageliecnse;
  String? drivelicense;

  CarGp(
      {this.passengerid,
      this.fname,
      this.lname,
      this.phonenumber,
      this.gender,
      this.username,
      this.imagefile,
      this.carownerid,
      this.carid,
      this.cartype,
      this.carmodel,
      this.carmmodel,
      this.carnumber,
      this.imageliecnse,
      this.drivelicense});

  CarGp.fromJson(Map<String, dynamic> json) {
    passengerid = json['passengerid'];
    fname = json['fname'];
    lname = json['lname'];
    phonenumber = json['phonenumber'];
    gender = json['gender'];
    username = json['username'];
    imagefile = json['imagefile'];
    carownerid = json['carownerid'];
    carid = json['carid'];
    cartype = json['cartype'];
    carmodel = json['carmodel'];
    carmmodel = json['carmmodel'];
    carnumber = json['carnumber'];
    imageliecnse = json['imageliecnse'];
    drivelicense = json['drivelicense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['passengerid'] = this.passengerid;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phonenumber'] = this.phonenumber;
    data['gender'] = this.gender;
    data['username'] = this.username;
    data['imagefile'] = this.imagefile;
    data['carownerid'] = this.carownerid;
    data['carid'] = this.carid;
    data['cartype'] = this.cartype;
    data['carmodel'] = this.carmodel;
    data['carmmodel'] = this.carmmodel;
    data['carnumber'] = this.carnumber;
    data['imageliecnse'] = this.imageliecnse;
    data['drivelicense'] = this.drivelicense;
    return data;
  }
}
