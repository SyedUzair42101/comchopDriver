import 'package:delivery_boy_application/tabbar/Earnings.dart';
import 'package:delivery_boy_application/tabbar/dashboard.dart';
import 'package:delivery_boy_application/tabbar/history.dart';
import 'package:delivery_boy_application/tabbar/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';



// class tabbar extends StatefulWidget {
//   const tabbar({Key? key}) : super(key: key);
//
//   @override
//   _tabbarState createState() => _tabbarState();
// }
//
// class _tabbarState extends State<tabbar> {
//   int _currentIndex = 0;
//   final List<Widget> _children = [
//     // home_screen1(),
//     // SignIn(),
//     // aboutus(),
//     dashboard(),
//     Earning(),
//     history(),
//     profile(),
//
//
//   ];
//   void onTappedBar(int index)
//   {
//     setState(() {
//       _currentIndex = index;
//     });
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//       _children[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTappedBar,
//         currentIndex: _currentIndex,
//         backgroundColor:  Color.fromRGBO(230, 231, 232,10  ) ,
//         selectedItemColor: Color.fromRGBO(252, 186, 24, 1) ,
//         unselectedItemColor: Colors.black.withOpacity(.60),
//         selectedFontSize: 10,
//         unselectedFontSize: 8,
//
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text(  'Home' ),
//
//           ),
//           // BottomNavigationBarItem(
//           //     icon: new Icon(Icons.home),
//           //     title: new Text("DemoHome")
//           // ),
//           BottomNavigationBarItem(
//             icon:  Icon(Icons. account_balance_wallet_rounded),
//             title: Text(  'Earning' ) ,      ),
//           BottomNavigationBarItem(
//
//               icon: Icon(Icons. history),
//               title: Text(  'Earning' )
//           ),
//           BottomNavigationBarItem(
//               icon:  Icon(Icons. person),
//               title: Text(  'Profile' )
//               ),
//         ],
//       ),
//     );
//   }
// }


class tab_bar_screen extends StatefulWidget {

  const tab_bar_screen({Key? key}) : super(key: key);

  @override
  _tab_bar_screenState createState() => _tab_bar_screenState();
}

class _tab_bar_screenState extends State<tab_bar_screen> {

  List<Widget> _buildScreens() {
    return [
      dashboard(),
      Earning(),
      history(),
      profile(),
    ];
  }


  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title:   'Home'  ,
        activeColorPrimary:  Color.fromRGBO(252, 186, 24, 1),
        inactiveColorPrimary:  Color.fromRGBO(252, 186, 24, 1),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_balance_wallet),
        title:   'Earning' ,
        activeColorPrimary:  Color.fromRGBO(252, 186, 24, 1),
        inactiveColorPrimary:  Color.fromRGBO(252, 186, 24, 1),

      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons. history),
        title:   'history' ,
        activeColorPrimary:  Color.fromRGBO(252, 186, 24, 1),
        inactiveColorPrimary:  Color.fromRGBO(252, 186, 24, 1),
      ),
      PersistentBottomNavBarItem(
        icon:  Icon(Icons. person),
        title:    'Profile'  ,
        activeColorPrimary:  Color.fromRGBO(252, 186, 24, 1),
        inactiveColorPrimary:  Color.fromRGBO(252, 186, 24, 1),
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
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

