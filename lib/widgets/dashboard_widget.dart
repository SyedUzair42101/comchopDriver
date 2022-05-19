import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class dashboardwidget{

 Widget  cicularbar(){
    return SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator
          (color:Color.fromRGBO(252, 186, 24, 1),backgroundColor: Colors.white,strokeWidth: 3,));
  }
}
