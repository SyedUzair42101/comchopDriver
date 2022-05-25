import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:delivery_boy_application/models/walletModel.dart';
import 'package:delivery_boy_application/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Earning extends StatelessWidget {
  const Earning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<http_service>(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          title: Text(
            'Earnings',
            style: TextStyle(color: Colors.black),
          ),
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
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(252, 186, 24, 1),
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: Text(
                              'Wallet',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(height:20),
                  FutureBuilder<wallet?>(
                      future: provider.Wallet(),
                      builder: (c,   snap) {
                        if (snap.connectionState == ConnectionState.waiting)
                          return Center(child: dashboardwidget().cicularbar());
                        if (snap.hasData) {
                          return
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Container(
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    height: 143,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: new BoxDecoration(
                                        color: Color.fromRGBO(244, 244, 244, 1),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          height: 100,
                                          width: 170,
                                          decoration: new BoxDecoration(
                                              color: Color.fromRGBO(244, 244, 244, 1),
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('Total',
                                                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                                              Text('Payable: \$${snap.data!.driverWallet!.payable}'   ,
                                                style: TextStyle(fontSize: 17),),
                                              Text('Receivable: \$${snap.data!.driverWallet!.receivable}'   ,
                                                style: TextStyle(fontSize: 17),),

                                            ],
                                          ),
                                        ),
                                      ],

                                    )



                                ),
                              ),
                            );
                        } else {
                          return dashboardwidget().cicularbar();
                        }
                      })

                ],
              ),
            ),
          ),
        ));
  }
}
