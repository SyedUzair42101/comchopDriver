import 'package:flutter/material.dart';

class Earning extends StatelessWidget {
  const Earning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Text(
                            'Wallet',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 80,
                    width: 150,
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(244, 244, 244, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today'),
                        Text(
                          '\$345.00',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text('02 feb, 2021'),
                      ],
                    ),
                  ),
                  for (var i = 0; i < 6; i++)
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                          color: Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Order ID: ',
                                style: TextStyle(
                                    color: Color.fromRGBO(136, 136, 136, 1)),
                              ),
                              Text(
                                'ACR145786',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Payment :',
                                style: TextStyle(
                                    color: Color.fromRGBO(136, 136, 136, 1)),
                              ),
                              Text(
                                ' Online',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Date:  ',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(136, 136, 136, 1)),
                                  ),
                                  Text(
                                    '02 feb, 2021',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              Text(
                                '\$345.00',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
