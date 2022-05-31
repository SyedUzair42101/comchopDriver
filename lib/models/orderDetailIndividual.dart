class invdorder {
  bool? status;
  String? orderId;
  int? totalPrice;
  Customer? customer;
  List<OrderDetail>? orderDetail;

  invdorder(
      {this.status,
      this.orderId,
      this.totalPrice,
      this.customer,
      this.orderDetail});

  invdorder.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    orderId = json['orderId'];
    totalPrice = json['total_price'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['orderDetail'] != null) {
      orderDetail = <OrderDetail>[];
      json['orderDetail'].forEach((v) {
        orderDetail!.add(new OrderDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['orderId'] = this.orderId;
    data['total_price'] = this.totalPrice;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.orderDetail != null) {
      data['orderDetail'] = this.orderDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  String? name;
  String? phone;

  Customer({this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class OrderDetail {
  String? menu;
  int? price;

  OrderDetail({this.menu, this.price});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    menu = json['menu'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu'] = this.menu;
    data['price'] = this.price;
    return data;
  }
}
