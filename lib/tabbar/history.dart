import 'package:flutter/material.dart';

class history extends StatelessWidget {
  const history({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                for (var i = 0; i < 14; i++)
                  Container(
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
                                    Text( 'Order ID: ',style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),),
                                    Text( 'ACR145786',style: TextStyle(fontWeight: FontWeight.w700),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text( 'Payment :',style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),),
                                    Text( ' Online',style: TextStyle(fontWeight: FontWeight.w700),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text( 'Total Payment :',style: TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),),
                                    Text( ' \$345.00',style: TextStyle(fontWeight: FontWeight.w700),),
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
                              Text( ' Delivered',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.red),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

              ],
            ),
          ),
        ));
  }
}
