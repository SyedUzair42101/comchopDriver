class completeOrder {
  List<Data>? data;

  completeOrder({this.data});

  completeOrder.fromJson(Map<String, dynamic> json) {
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
        this.updatedAt});

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
    return data;
  }
}