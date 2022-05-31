import 'package:delivery_boy_application/details/alertbox.dart';
import 'package:delivery_boy_application/details/orders_routing.dart';
import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:delivery_boy_application/models/models.dart';
import 'package:delivery_boy_application/models/orderDetailIndividual.dart';
import 'package:delivery_boy_application/views/user_vendor_locations.dart';
import 'package:delivery_boy_application/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class avilable_delievries extends StatelessWidget {
  const avilable_delievries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<http_service>(context, listen: false);
    // var http_services = Provider.of<http_service>(context);
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
                    if (!snap.hasData)
                      return Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Nothing to show here\nEmpty',
                            textAlign: TextAlign.center,
                          ));
                    if (snap.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snap.data!.data!.length,
                          itemBuilder: (ctx, i) {
                            Future<SharedPreferences> prefs =
                                SharedPreferences.getInstance();
                            var order_id = '${snap.data!.data![i].order!.id}';
                            // ignore: unused_local_variable
                            //var a = prefs.setString('order',  order_id );
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              height: 210,
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
                                                order_id,
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
                                    height: 128,
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
                                                    fontWeight: FontWeight.w600,
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
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          uservendoes_location()),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      252, 186, 24, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                ),
                                                height: 35,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                child: Center(
                                                  child: Text(
                                                    'Show on Map',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                provider.orderDetailInd(
                                                    order_id, context);
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      252, 186, 24, 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                ),
                                                height: 35,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                child: Center(
                                                  child: Text(
                                                    'Details',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
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

  // openAlertBox(BuildContext context) {
  //   return
  // }
}
