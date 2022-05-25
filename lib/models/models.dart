class orderview {
  List<Data>? data;

  orderview({this.data});

  orderview.fromJson(Map<String, dynamic> json) {
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
  int? driverId;
  int? orderId;
  int? status;
  String? createdAt;
  String? updatedAt;
  Order? order;

  Data(
      {this.id,
        this.driverId,
        this.orderId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.order});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    orderId = json['order_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver_id'] = this.driverId;
    data['order_id'] = this.orderId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  int? userId;
  int? restaurantId;
  int? subTotal;
  int? vatValue;
  int? totalPrice;
  String? paymentMethod;
  String? specialInstructions;
  int? status;
  String? createdAt;
  String? updatedAt;
  Restaurant? restaurant;
  Buyer? buyer;

  Order(
      {this.id,
        this.userId,
        this.restaurantId,
        this.subTotal,
        this.vatValue,
        this.totalPrice,
        this.paymentMethod,
        this.specialInstructions,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.restaurant,
        this.buyer});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    subTotal = json['sub_total'];
    vatValue = json['vat_value'];
    totalPrice = json['total_price'];
    paymentMethod = json['payment_method'];
    specialInstructions = json['special_instructions'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
    buyer = json['buyer'] != null ? new Buyer.fromJson(json['buyer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    data['sub_total'] = this.subTotal;
    data['vat_value'] = this.vatValue;
    data['total_price'] = this.totalPrice;
    data['payment_method'] = this.paymentMethod;
    data['special_instructions'] = this.specialInstructions;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    if (this.buyer != null) {
      data['buyer'] = this.buyer!.toJson();
    }
    return data;
  }
}

class Restaurant {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? ownerName;
  String? logoImg;
  String? password;
  String? address;
  String? latitude;
  String? longitude;
  int? serviceRadius;
  int? serviceStatus;
  int? status;
  String? createdAt;
  String? updatedAt;

  Restaurant(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.ownerName,
        this.logoImg,
        this.password,
        this.address,
        this.latitude,
        this.longitude,
        this.serviceRadius,
        this.serviceStatus,
        this.status,
        this.createdAt,
        this.updatedAt});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    ownerName = json['owner_name'];
    logoImg = json['logo_img'];
    password = json['password'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceRadius = json['service_radius'];
    serviceStatus = json['service_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['owner_name'] = this.ownerName;
    data['logo_img'] = this.logoImg;
    data['password'] = this.password;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['service_radius'] = this.serviceRadius;
    data['service_status'] = this.serviceStatus;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Buyer {
  int? id;
  String? name;
  String? email;
  String? phone;
  Null? emailVerifiedAt;
  String? facebookId;
  String? googleId;
  int? status;
  Null? otpByemail;
  String? createdAt;
  String? updatedAt;
  UserAddress? userAddress;

  Buyer(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.facebookId,
        this.googleId,
        this.status,
        this.otpByemail,
        this.createdAt,
        this.updatedAt,
        this.userAddress});

  Buyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    facebookId = json['facebook_id'];
    googleId = json['google_id'];
    status = json['status'];
    otpByemail = json['otp_byemail'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userAddress = json['user_address'] != null
        ? new UserAddress.fromJson(json['user_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['facebook_id'] = this.facebookId;
    data['google_id'] = this.googleId;
    data['status'] = this.status;
    data['otp_byemail'] = this.otpByemail;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userAddress != null) {
      data['user_address'] = this.userAddress!.toJson();
    }
    return data;
  }
}

class UserAddress {
  int? id;
  int? userId;
  String? address;
  String? latitude;
  String? longitude;

  UserAddress(
      {this.id, this.userId, this.address, this.latitude, this.longitude});

  UserAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}