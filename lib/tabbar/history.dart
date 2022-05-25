import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:delivery_boy_application/models/orderDetails.dart';
import 'package:delivery_boy_application/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class history extends StatelessWidget {
  const history({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<http_service>(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          title: Text(
            'History',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(

            padding: EdgeInsets.only(left: 10, right: 10, ),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,

                  decoration: new BoxDecoration(
                      color: Color.fromRGBO(252, 186, 24, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Today',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),




                SizedBox(
                  height: 10,
                ),
                FutureBuilder<completeOrder?>(
                    future: provider.completeorder(),
                    builder: (c,   snap) {
                      if (snap.connectionState == ConnectionState.waiting)
                        return Center(child: dashboardwidget().cicularbar());
                      if (snap.hasData) {
                        return
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snap.data!.data!.length,
                              itemBuilder: (ctx,i){
                                return  Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10),
                                  height: 130,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: new BoxDecoration(
                                      color: Color.fromRGBO(244, 244, 244, 1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [
                                          Container(

                                            width:40,
                                            child: Center(child: Image.asset('images/iconbike.png')),
                                          ),
                                          SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text( 'Order ID:  ',style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),),
                                                  Text( '${snap.data!.data![i].orderId}',style: TextStyle(fontWeight: FontWeight.w700),),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text( 'Payment :',style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),),
                                                  Text( '${snap.data!.data![i].order!.paymentMethod}',style: TextStyle(fontWeight: FontWeight.w700),),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text( 'Total Payment :',style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),),
                                                  Text( ' ${snap.data!.data![i].order!.totalPrice}',style: TextStyle(fontWeight: FontWeight.w700),),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 50,
                                        width: MediaQuery.of(context).size.width,

                                        child: Row(
                                          children: [
                                            Text( 'Order Status:',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),),
                                            ' ${snap.data!.data![i].order!.status}'== 3 ? new Text("  Delivered",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),) : new Text(" Cancel",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.red),),


                                          //  Text( ' ${snap.data!.data![i].order!.status}',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.red),),
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
        ));
  }
}
