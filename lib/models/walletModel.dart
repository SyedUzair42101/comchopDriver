class wallet {
  DriverWallet? driverWallet;

  wallet({this.driverWallet});

  wallet.fromJson(Map<String, dynamic> json) {
    driverWallet = json['DriverWallet'] != null
        ? new DriverWallet.fromJson(json['DriverWallet'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.driverWallet != null) {
      data['DriverWallet'] = this.driverWallet!.toJson();
    }
    return data;
  }
}

class DriverWallet {
  int? id;
  int? driverId;
  int? receivable;
  int? payable;

  DriverWallet({this.id, this.driverId, this.receivable, this.payable});

  DriverWallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
    receivable = json['receivable'];
    payable = json['payable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driver_id'] = this.driverId;
    data['receivable'] = this.receivable;
    data['payable'] = this.payable;
    return data;
  }
}