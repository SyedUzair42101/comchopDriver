import 'dart:convert';

import 'package:delivery_boy_application/models/models.dart';
import 'package:delivery_boy_application/models/orderDetails.dart';
import 'package:delivery_boy_application/models/profileDetails.dart';
import 'package:delivery_boy_application/models/walletModel.dart';
import 'package:delivery_boy_application/models/walletModel.dart';
import 'package:delivery_boy_application/models/walletModel.dart';
import 'package:delivery_boy_application/tabbar/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class http_service with ChangeNotifier{
  var latitude;
  var longtitude;
  var baseurl = 'https://dnpprojects.com/demo/comshop/api/';
  final _prefs = SharedPreferences.getInstance();
  bool islogin = false;


  void login(username,password,BuildContext context) async {
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
        islogin = false;
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  tab_bar_screen()),
        );

      }
      else {
        islogin = false;
        notifyListeners();
      }


  }
  void driverworkstatus(status)async{
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
      notifyListeners();
      return datas;
    }
    else {
      return;
    }
  }
  Future updatelocation (lat,lon)async{
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
    }
    else {
      return;
    }
  }
Future<orderview?>  Showorders()async{
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
    }
   else{
     return null;
    }
  } on Exception catch (exception) {
   return null;
  } catch (error) {
    print(error.toString());
  return null;
  }

}

  Future<orderview?>  all0rders()async{
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
      }
      else{
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }

  }

  Future<wallet?>  Wallet()async{
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
        var responsedata =  wallet.fromJson(datas);
        return responsedata;
      }
      else{
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }

  }

  Future<completeOrder?>  completeorder()async{
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
      }
      else{
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }

  }

  Future<driverProfile?>  driverprofile()async{
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
      }
      else{
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }

  }


  void changePassword(password,newpassword,confirmpassword,BuildContext context) async {
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
    }
    else {
      islogin = false;
      notifyListeners();
    }


  }






  }



