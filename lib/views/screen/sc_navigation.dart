import 'package:bds_nv/bottom_icon_icons.dart';
import 'package:bds_nv/views/screen/person_page/person_screen.dart';
import 'package:bds_nv/views/screen/complainList_screen.dart';
import 'package:bds_nv/views/screen/home.dart';

import 'package:bds_nv/views/screen/profile.dart';
import 'package:bds_nv/views/screen/salary_detail.dart';
import 'package:bds_nv/views/screen/visitor_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../my_theme.dart';
import 'leave_request_list.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key? key, go_back = true}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  PersistentTabController? _controller = PersistentTabController();
  late final BuildContext menuScreenContext;

  fetchAll() {}

  void goToPage(int i) {
    fetchAll();

    setState(() {});
    _controller!;
  }

  @override
  void initState() {
    super.initState();
    fetchAll();
    _controller = PersistentTabController(initialIndex: 0);
    getPref();
  }

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bool isSaveAddress = prefs.getBool("isSaveAddress") ?? false;
      print("Alo alo alo: ${isSaveAddress}");
      int? selectedShop = prefs.getInt("selectedShopId");
      print("Alo alo alo1: ${selectedShop}");
      String? selectedShopname = prefs.getString("selectedShopName");
      print("Alo alo alo2: ${selectedShopname}");
    });
  }

  @override
  void didChangeDependencies() {
    //_controller?.dispose();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomeScreen(),
        PersonScreen(),
        VisitorScreen(),
        ComplainListScreen(),
        ProfileScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() => [
          PersistentBottomNavBarItem(
            icon: Icon(
              BottomIcon.home,
              size: 26,
            ),
            title: AppLocalizations.of(context)!.home_ucf,
            activeColorPrimary: MyTheme.accent_color,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(
              BottomIcon.person,
              size: 18,
            ),
            title: "Người dùng",
            // title: AppLocalizations.of(context)!.tenant_details,
            activeColorPrimary: MyTheme.accent_color,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(
              BottomIcon.visitor,
              size: 20,
            ),
            title: "Khách",
            // title: AppLocalizations.of(context)!.complain,
            activeColorPrimary: MyTheme.accent_color,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(
              BottomIcon.message,
              //  color: MyTheme.accent_color,
            ),
            title: "Phản ánh",
            // title: AppLocalizations.of(context)!.report,
            activeColorPrimary: MyTheme.accent_color,
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(
              BottomIcon.profile,
              // color: MyTheme.accent_color,
            ),
            title: AppLocalizations.of(context)!.profile_ucf,
            activeColorPrimary: MyTheme.accent_color,
            inactiveColorPrimary: Colors.grey,
          ),
        ];

    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      navBarStyle: NavBarStyle.style3,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      onItemSelected: (value) {
        setState(() {
          _controller!.index = value;
          if (value == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NavigationScreen()),
            ).then((value) {
              if (mounted) {
                setState(() {
                  // homeData!.onRefresh();
                });
              }
            });
          } else {
            // is_change_logged_in.$ = true;
            // is_change_logged_in.save();
          }
        });
      },
    );
  }
}
