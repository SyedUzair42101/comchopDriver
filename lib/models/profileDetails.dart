class driverProfile {
  List<Data>? data;

  driverProfile({this.data});

  driverProfile.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  int? cityId;
  String? latitude;
  String? longitude;
  int? status;
  int? workingStatus;
  Null? otpByemail;
  String? createdAt;
  String? updatedAt;
  Null? driverDoc;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.emailAddress,
        this.phoneNumber,
        this.cityId,
        this.latitude,
        this.longitude,
        this.status,
        this.workingStatus,
        this.otpByemail,
        this.createdAt,
        this.updatedAt,
        this.driverDoc});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    emailAddress = json['email_address'];
    phoneNumber = json['phone_number'];
    cityId = json['city_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    workingStatus = json['working_status'];
    otpByemail = json['otp_byemail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    driverDoc = json['driver_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email_address'] = this.emailAddress;
    data['phone_number'] = this.phoneNumber;
    data['city_id'] = this.cityId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['working_status'] = this.workingStatus;
    data['otp_byemail'] = this.otpByemail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['driver_doc'] = this.driverDoc;
    return data;
  }
}