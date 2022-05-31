import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:delivery_boy_application/models/orderDetailIndividual.dart';
import 'package:delivery_boy_application/models/walletModel.dart';
import 'package:delivery_boy_application/views/user_vendor_locations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class dashboardwidget {
  Widget cicularbar() {
    return SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(
          color: Color.fromRGBO(252, 186, 24, 1),
          backgroundColor: Colors.white,
          strokeWidth: 3,
        ));
  }
}

// class popop {
//   //  final provider = Provider.of<http_service>((context));
//   static Popop(
//     BuildContext context,
//     ab,
//   ) {
//     final provider = Provider.of<http_service>((context));
//     return FutureBuilder<invdorder?>(
//         future: provider.orderDetailInd(ab, context),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting)
//             return Center(child: dashboardwidget().cicularbar());
//           else {
//             showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     contentPadding: EdgeInsets.only(top: 0.0, bottom: 10),
//                     backgroundColor: Color.fromRGBO(242, 242, 242, 1),
//                     content: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Color.fromRGBO(252, 186, 24, 1),
//                             borderRadius: BorderRadius.all(Radius.circular(0)),
//                           ),
//                           height: 50,
//                           child: Center(
//                             child: Text(
//                               ab,
//                               //   '${snap.data!.data![i].orderId}',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(5),
//                           padding: EdgeInsets.all(10),
//                           height: 113,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: new BoxDecoration(
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Center(
//                                 child: Text(
//                                   'Order',
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(252, 186, 24, 1),
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Divider(
//                                 color: Colors.grey,
//                                 height: 4.0,
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     ab,
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(136, 136, 136, 1),
//                                         fontSize: 12),
//                                   ),
//                                   Text(
//                                     ' \$345.00',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     '7up Regular 250ml',
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(136, 136, 136, 1),
//                                         fontSize: 12),
//                                   ),
//                                   Text(
//                                     ' \$9.00',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Delivery Charge',
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(252, 186, 24, 1),
//                                         fontSize: 12),
//                                   ),
//                                   Text(
//                                     ' \$345.00',
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(252, 186, 24, 1),
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Total',
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(136, 136, 136, 1),
//                                         fontSize: 12),
//                                   ),
//                                   Text(
//                                     ' \$345.00',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 12),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(5),
//                           padding: EdgeInsets.all(10),
//                           height: 113,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: new BoxDecoration(
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Center(
//                                 child: Text(
//                                   'Customer',
//                                   style: TextStyle(
//                                       color: Color.fromRGBO(252, 186, 24, 1),
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                               Divider(
//                                 color: Colors.grey,
//                                 height: 4.0,
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Name                                             ',
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(136, 136, 136, 1),
//                                         fontSize: 12),
//                                   ),
//                                   Text(
//                                     'Saman John',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Mobile Number',
//                                     style: TextStyle(
//                                         color: Color.fromRGBO(136, 136, 136, 1),
//                                         fontSize: 12),
//                                   ),
//                                   Text(
//                                     ' (+91) 65666333',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                   height: 50,
//                                   width: 150,
//                                   child: MaterialButton(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(6)),
//                                       color: Color.fromRGBO(252, 186, 24, 1),
//                                       child: Text(
//                                         'Deleivered',
//                                         style: TextStyle(
//                                           fontFamily: 'Roboto',
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   uservendoes_location()),
//                                         );
//                                       })),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               // Container(
//                               //     height: 30,
//                               //     width: 90,
//                               //     child: MaterialButton(
//                               //         shape: RoundedRectangleBorder(
//                               //             borderRadius: BorderRadius.circular(6)),
//                               //         color: Color.fromRGBO(252, 186, 24, 1),
//                               //         child: Text(
//                               //           'Accept',
//                               //           style: TextStyle(
//                               //             fontFamily: 'Roboto',
//                               //             color: Colors.white,
//                               //           ),
//                               //         ),
//                               //         onPressed: () {
//                               //           Navigator.push(
//                               //             context,
//                               //             MaterialPageRoute(
//                               //                 builder: (BuildContext context) =>
//                               //                     orders_routing()),
//                               //           );
//                               //         })),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 });
//           }
//           return Container();
//         });
//   }
// }





// class popop {
//   static Popup(
//     BuildContext context,
//     // String order_id,
//   ) async {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10))),
//             contentPadding: EdgeInsets.only(top: 0.0, bottom: 10),
//             backgroundColor: Color.fromRGBO(242, 242, 242, 1),
//             content: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Color.fromRGBO(252, 186, 24, 1),
//                     borderRadius: BorderRadius.all(Radius.circular(0)),
//                   ),
//                   height: 50,
//                   child: Center(
//                     child: Text(
//                       "aaaa",
//                       //   '${snap.data!.data![i].orderId}',
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.all(10),
//                   height: 113,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: new BoxDecoration(
//                       color: Color.fromRGBO(255, 255, 255, 1),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Center(
//                         child: Text(
//                           'Order',
//                           style: TextStyle(
//                               color: Color.fromRGBO(252, 186, 24, 1),
//                               fontWeight: FontWeight.w700),
//                         ),
//                       ),
//                       Divider(
//                         color: Colors.grey,
//                         height: 4.0,
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Deal1',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(136, 136, 136, 1),
//                                 fontSize: 12),
//                           ),
//                           Text(
//                             ' \$345.00',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '7up Regular 250ml',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(136, 136, 136, 1),
//                                 fontSize: 12),
//                           ),
//                           Text(
//                             ' \$9.00',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Delivery Charge',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(252, 186, 24, 1),
//                                 fontSize: 12),
//                           ),
//                           Text(
//                             ' \$345.00',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(252, 186, 24, 1),
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Total',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(136, 136, 136, 1),
//                                 fontSize: 12),
//                           ),
//                           Text(
//                             ' \$345.00',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 12),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.all(10),
//                   height: 113,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: new BoxDecoration(
//                       color: Color.fromRGBO(255, 255, 255, 1),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Center(
//                         child: Text(
//                           'Customer',
//                           style: TextStyle(
//                               color: Color.fromRGBO(252, 186, 24, 1),
//                               fontWeight: FontWeight.w700),
//                         ),
//                       ),
//                       Divider(
//                         color: Colors.grey,
//                         height: 4.0,
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Name                                             ',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(136, 136, 136, 1),
//                                 fontSize: 12),
//                           ),
//                           Text(
//                             'Saman John',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Mobile Number',
//                             style: TextStyle(
//                                 color: Color.fromRGBO(136, 136, 136, 1),
//                                 fontSize: 12),
//                           ),
//                           Text(
//                             ' (+91) 65666333',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 12),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                           height: 50,
//                           width: 150,
//                           child: MaterialButton(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(6)),
//                               color: Color.fromRGBO(252, 186, 24, 1),
//                               child: Text(
//                                 'Deleivered',
//                                 style: TextStyle(
//                                   fontFamily: 'Roboto',
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           uservendoes_location()),
//                                 );
//                               })),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       // Container(
//                       //     height: 30,
//                       //     width: 90,
//                       //     child: MaterialButton(
//                       //         shape: RoundedRectangleBorder(
//                       //             borderRadius: BorderRadius.circular(6)),
//                       //         color: Color.fromRGBO(252, 186, 24, 1),
//                       //         child: Text(
//                       //           'Accept',
//                       //           style: TextStyle(
//                       //             fontFamily: 'Roboto',
//                       //             color: Colors.white,
//                       //           ),
//                       //         ),
//                       //         onPressed: () {
//                       //           Navigator.push(
//                       //             context,
//                       //             MaterialPageRoute(
//                       //                 builder: (BuildContext context) =>
//                       //                     orders_routing()),
//                       //           );
//                       //         })),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
