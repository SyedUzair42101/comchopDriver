import 'package:delivery_boy_application/details/alertbox.dart';
import 'package:delivery_boy_application/login_signup_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class orders_routing extends StatelessWidget {
  const orders_routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      const LatLng _center = const LatLng(45.521563, -122.677433);

    return
    Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
               padding: EdgeInsets.all(10),
                height: 322,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text( 'Order Tracking',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),

                    ListTile(
                      subtitle: Text( 'Delivery Man'),
                      leading: Image.asset('images/person.png') ,
                      title:Text( 'Cameron Williamson')  ,
                      trailing:Icon( Icons.phone,color: Color.fromRGBO(252, 186, 24, 1),) ,
                    ),
                    ListTile(
                      subtitle: Text( 'Street: 48,Hunters Road, Vepery'),
                      leading: Container(
                        width:40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(252, 186, 24, 0.2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.add_location_rounded,
                          color: Color.fromRGBO(252, 186, 24, 1),
                          size: 20,
                        ),
                      ),
                      title:Text( 'Delivery Address')  ,

                    ),
                    ListTile(
                      subtitle: Text( '03:00PM (Max 20 min)'),
                      leading: Container(
                        width:40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(252, 186, 24, 0.2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.  access_time,
                          color: Color.fromRGBO(252, 186, 24, 1),
                          size: 20,
                        ),
                      ),
                      title:Text( 'Delivery Time')  ,

                    ),
                    Container(
                        height: 40,
                        width: 140,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            color: Color.fromRGBO(252, 186, 24, 1),
                            child: Text(
                              'Complete',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                             modal().sucessorder(context);

                            })),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
