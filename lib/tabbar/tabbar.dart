import 'dart:convert';
import 'dart:developer';

import 'package:delivery_boy_application/notic2.dart';
import 'package:delivery_boy_application/tabbar/Earnings.dart';
import 'package:delivery_boy_application/tabbar/dashboard.dart';
import 'package:delivery_boy_application/tabbar/history.dart';
import 'package:delivery_boy_application/tabbar/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class tab_bar_screen extends StatefulWidget {
  final sts;
  const tab_bar_screen({Key? key, this.sts}) : super(key: key);

  @override
  _tab_bar_screenState createState() => _tab_bar_screenState();
}

class _tab_bar_screenState extends State<tab_bar_screen> {
  PusherClient? pusher;
  Channel? channel;
  String? _title;
  String? _orderid;
  List? resData;
  @override
  void initState() {
    super.initState();

    pusher = PusherClient(
        "80ca8167ced5361525f1",
        PusherOptions(
          encrypted: false,
          cluster: 'ap2',
        ),
        enableLogging: true,
        autoConnect: false);

    pusher!.connect();
    channel = pusher!.subscribe("notify_channel_${widget.sts}");

    pusher!.onConnectionStateChange((state) {
      log("previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });
    print(widget.sts);
    pusher!.onConnectionError((error) {
      log("error: ${error!.message}");
    });

    channel!.bind('getNotify', (event) {
      var data = event?.data;
      var jsonsDataString = data
          .toString(); // toString of Response's body is assigned to jsonDataString
      var _data = json.decode(jsonsDataString);
      print(widget.sts);
      setState(() {
        _title = _data['title'];
        _orderid = _data['orderId'];
        NotificationService()
            .showNotification(1, "$_title", "Order# : $_orderid", 10);
      });
    });
    tz.initializeTimeZones();
  }

  List<Widget> _buildScreens() {
    return [
      dashboard(),
      Earning(),
      history(),
      profile(),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: 'Home',
        activeColorPrimary: Color.fromRGBO(252, 186, 24, 1),
        inactiveColorPrimary: Color.fromRGBO(252, 186, 24, 1),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_balance_wallet),
        title: 'Earning',
        activeColorPrimary: Color.fromRGBO(252, 186, 24, 1),
        inactiveColorPrimary: Color.fromRGBO(252, 186, 24, 1),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.history),
        title: 'history',
        activeColorPrimary: Color.fromRGBO(252, 186, 24, 1),
        inactiveColorPrimary: Color.fromRGBO(252, 186, 24, 1),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: 'Profile',
        activeColorPrimary: Color.fromRGBO(252, 186, 24, 1),
        inactiveColorPrimary: Color.fromRGBO(252, 186, 24, 1),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}
