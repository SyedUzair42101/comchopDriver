import 'package:delivery_boy_application/details/alertbox.dart';
import 'package:delivery_boy_application/details/orders_routing.dart';
import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:delivery_boy_application/models/models.dart';
import 'package:delivery_boy_application/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class avilable_delievries extends StatelessWidget {
  const avilable_delievries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<http_service>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Available Deliveries',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<orderview?>(
                  future: provider.all0rders(),
                  builder: (c, snap) {
                    if (snap.connectionState == ConnectionState.waiting)
                      return Center(child: dashboardwidget().cicularbar());
                    if (snap.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snap.data!.data!.length,
                          itemBuilder: (ctx, i) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              height: 143,
                              width: MediaQuery.of(context).size.width,
                              decoration: new BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 244, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        child: Center(
                                            child: Image.asset(
                                                'images/iconbike.png')),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Order ID: ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1),
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                '${snap.data!.data![i].orderId}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Payment :',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1),
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                '${snap.data!.data![i].order!.paymentMethod}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Total Payment :',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        136, 136, 136, 1),
                                                    fontSize: 12),
                                              ),
                                              Text(
                                                ' \$ ${snap.data!.data![i].order!.subTotal}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 63,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.add_location_rounded,
                                              color: Color.fromRGBO(
                                                  252, 186, 24, 1),
                                              size: 15,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${snap.data!.data![i].order!.restaurant!.address}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.assistant_navigation,
                                                  color: Color.fromRGBO(
                                                      252, 186, 24, 1),
                                                  size: 15,
                                                ),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text(
                                                  '${snap.data!.data![i].order!.buyer!.userAddress!.address}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                openAlertBox(context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        252, 186, 24, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Icon(
                                                  Icons.arrow_forward_outlined,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return dashboardwidget().cicularbar();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  openAlertBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
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
                    child: Text(
                      'Order ID: ACR145786',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
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
                            'Deal1',
                            style: TextStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                                fontSize: 12),
                          ),
                          Text(
                            ' \$345.00',
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
                            '7up Regular 250ml',
                            style: TextStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                                fontSize: 12),
                          ),
                          Text(
                            ' \$9.00',
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
                            'Delivery Charge',
                            style: TextStyle(
                                color: Color.fromRGBO(252, 186, 24, 1),
                                fontSize: 12),
                          ),
                          Text(
                            ' \$345.00',
                            style: TextStyle(
                                color: Color.fromRGBO(252, 186, 24, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                color: Color.fromRGBO(136, 136, 136, 1),
                                fontSize: 12),
                          ),
                          Text(
                            ' \$345.00',
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
                            'Saman John',
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
                            ' (+91) 65666333',
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
                                modal().reject_order(context);
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
        });
  }
}
