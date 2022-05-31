import 'dart:convert';

import 'package:delivery_boy_application/models/models.dart';
import 'package:delivery_boy_application/models/orderDetailIndividual.dart';
import 'package:delivery_boy_application/models/orderDetails.dart';
import 'package:delivery_boy_application/models/profileDetails.dart';
import 'package:delivery_boy_application/models/walletModel.dart';
import 'package:delivery_boy_application/models/walletModel.dart';
import 'package:delivery_boy_application/models/walletModel.dart';
import 'package:delivery_boy_application/tabbar/tabbar.dart';
import 'package:delivery_boy_application/views/user_vendor_locations.dart';
import 'package:delivery_boy_application/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class http_service with ChangeNotifier {
  var latitude;
  var longtitude;
  var baseurl = 'https://dnpprojects.com/demo/comshop/api/';
  final _prefs = SharedPreferences.getInstance();
  bool islogin = false;

  void login(username, password, BuildContext context) async {
    notifyListeners();
    islogin = true;
    final SharedPreferences prefs = await _prefs;
    var userHeader = {"Accept": "application/json"};
    final response = await http.post(
      Uri.parse(
        '${baseurl}driverlogin?email_address=$username&password=$password',
      ),
      headers: userHeader,
    );
    if (response.statusCode == 200) {
      var datas = (jsonDecode(response.body));

      var token = datas['data']['token'];
      final token1 = prefs.setString('new', token);
      var userid = datas['data']['user_id'];
      // final status1 = prefs.setString('stat', status);
      print(userid);
      islogin = false;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => tab_bar_screen(sts: userid)),
      );
    } else {
      islogin = false;
      notifyListeners();
    }
  }

  void driverworkstatus(status) async {
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${baseurl}driverWorkStatus/$status',
      ),
      headers: userHeader,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var datas = (jsonDecode(response.body));
      print(datas);
      print("dddddddddd${status}");

      notifyListeners();
      return datas;
    } else {
      return;
    }
  }

  Future updatelocation(lat, lon) async {
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${baseurl}latlonupdate_driver/$lat/$lon/',
      ),
      headers: userHeader,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var datas = (jsonDecode(response.body));
      print(datas);
      notifyListeners();
      return datas;
    } else {
      return;
    }
  }

  Future<orderview?> all0rders() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final gettoken = prefs.getString('new');
      var userHeader = {
        "Accept": "application/json",
        'Authorization': 'Bearer $gettoken',
      };
      final response = await http.get(
        Uri.parse(
          '${baseurl}orderDetail',
        ),
        headers: userHeader,
      );
      print(response.body);
      if (response.statusCode == 200) {
        var datas = (jsonDecode(response.body));
        var responsedata = orderview.fromJson(datas);
        return responsedata;
      } else {
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<wallet?> Wallet() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final gettoken = prefs.getString('new');
      var userHeader = {
        "Accept": "application/json",
        'Authorization': 'Bearer $gettoken',
      };
      final response = await http.get(
        Uri.parse(
          '${baseurl}ShowdriverWallet',
        ),
        headers: userHeader,
      );
      print(response.body);
      if (response.statusCode == 200) {
        var datas = (jsonDecode(response.body));
        var responsedata = wallet.fromJson(datas);
        return responsedata;
      } else {
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<completeOrder?> completeorder() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final gettoken = prefs.getString('new');
      var userHeader = {
        "Accept": "application/json",
        'Authorization': 'Bearer $gettoken',
      };
      final response = await http.get(
        Uri.parse(
          '${baseurl}complete_orderlist',
        ),
        headers: userHeader,
      );
      print(response.body);
      if (response.statusCode == 200) {
        var datas = (jsonDecode(response.body));
        var responsedata = completeOrder.fromJson(datas);
        return responsedata;
      } else {
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<driverProfile?> driverprofile() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final gettoken = prefs.getString('new');
      var userHeader = {
        "Accept": "application/json",
        'Authorization': 'Bearer $gettoken',
      };
      final response = await http.get(
        Uri.parse(
          '${baseurl}driverProfile',
        ),
        headers: userHeader,
      );
      print(response.body);
      if (response.statusCode == 200) {
        var datas = (jsonDecode(response.body));
        var responsedata = driverProfile.fromJson(datas);
        return responsedata;
      } else {
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  void changePassword(
      password, newpassword, confirmpassword, BuildContext context) async {
    notifyListeners();
    islogin = true;
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${baseurl}driverchangePassword?old_password=$password&password=$newpassword&confirm_password=$confirmpassword',
      ),
      headers: userHeader,
    );
    if (response.statusCode == 200) {
      var datas = (jsonDecode(response.body));
      print(datas);

      notifyListeners();
      return datas;
    } else {
      islogin = false;
      notifyListeners();
    }
  }

  Future ordersuccessful(orderid, BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    final gettoken = prefs.getString('new');
    var userHeader = {
      "Accept": "application/json",
      'Authorization': 'Bearer $gettoken',
    };
    final response = await http.post(
      Uri.parse(
        '${baseurl}orderComplete/$orderid',
      ),
      headers: userHeader,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var datas = (jsonDecode(response.body));
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Icon(
                  Icons.check_circle_outlined,
                  size: 60,
                  color: Color.fromRGBO(252, 186, 24, 1),
                ),
                SizedBox(
                  height: 10,
                ),
                new Text(
                  "Order Deleivered Sucessfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      );

      print(datas);
      notifyListeners();
      return datas;
    } else {
      return;
    }
  }

  Future<invdorder?> orderDetailInd(orderid, BuildContext context) async {
    try {
      final SharedPreferences prefs = await _prefs;
      final gettoken = prefs.getString('new');
      var userHeader = {
        "Accept": "application/json",
        'Authorization': 'Bearer $gettoken',
      };
      final response = await http.get(
        Uri.parse(
          '${baseurl}orderDetailIndividual/$orderid',
        ),
        headers: userHeader,
      );
      var ab = orderid;
      print(response.body);
      var datas = (jsonDecode(response.body));
      var res = invdorder.fromJson(datas);
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext snap) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              contentPadding: EdgeInsets.only(top: 0.0, bottom: 10),
              backgroundColor: Color.fromRGBO(242, 242, 242, 1),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(252, 186, 24, 1),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    height: 50,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Order ID: ',
                            style: TextStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            orderid,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    height: 113,
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(
                            'Order',
                            style: TextStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 4.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Menu",
                              style: TextStyle(
                                  color: Color.fromRGBO(136, 136, 136, 1),
                                  fontSize: 12),
                            ),
                            Text(
                              res.orderDetail![0].menu.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                  color: Color.fromRGBO(136, 136, 136, 1),
                                  fontSize: 12),
                            ),
                            Text(
                              "\$" + res.totalPrice.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    height: 113,
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Text(
                            'Customer',
                            style: TextStyle(
                                color: Color.fromRGBO(252, 186, 24, 1),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 4.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name                                             ',
                              style: TextStyle(
                                  color: Color.fromRGBO(136, 136, 136, 1),
                                  fontSize: 12),
                            ),
                            Text(
                              res.customer!.name.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mobile Number',
                              style: TextStyle(
                                  color: Color.fromRGBO(136, 136, 136, 1),
                                  fontSize: 12),
                            ),
                            Text(
                              res.customer!.phone.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 50,
                            width: 150,
                            child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                color: Color.fromRGBO(252, 186, 24, 1),
                                child: Text(
                                  'Deleivered',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  ordersuccessful(orderid, context);
                                })),
                        SizedBox(
                          width: 10,
                        ),
                        // Container(
                        //     height: 30,
                        //     width: 90,
                        //     child: MaterialButton(
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(6)),
                        //         color: Color.fromRGBO(252, 186, 24, 1),
                        //         child: Text(
                        //           'Accept',
                        //           style: TextStyle(
                        //             fontFamily: 'Roboto',
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //         onPressed: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (BuildContext context) =>
                        //                     orders_routing()),
                        //           );
                        //         })),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
        print(datas);

        return res;
      } else {
        return datas;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
