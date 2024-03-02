import 'package:flutter/material.dart';

import '../../my_theme.dart';
import 'sc_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // PackageInfo _packageInfo = PackageInfo(
  //   appName: AppConfig.appName,
  //   packageName: 'Unknown',
  //   version: 'Unknown',
  //   buildNumber: 'Unknown',
  // );

  // Future<void> _initPackageInfo() async {
  //   final PackageInfo info = await PackageInfo.fromPlatform();
  //   setState(() {
  //     _packageInfo = info;
  //   });
  // }

  @override
  void initState() {
    super.initState();

    // _initPackageInfo();
    getSharedValueHelperData().then((value) {
      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NavigationScreen();
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return splashScreen();
  }

  Widget splashScreen() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: MyTheme.splash_screen_color,
          image: DecorationImage(image: AssetImage("assets/splash_back.png"))),
    );
  }

  Future<String?> getSharedValueHelperData() async {
    // access_token.load().whenComplete(() {
    //   AuthHelper().fetch_and_set();
    // });
    // //  AddonsHelper().setAddonsData();
    // BusinessSettingHelper().setBusinessSettingData();
    // await app_language.load();
    // await app_mobile_language.load();
    // await app_language_rtl.load();
    // await system_currency.load();
    // Provider.of<CurrencyPresenter>(context, listen: false).fetchListData();

    // // print("new splash screen ${app_mobile_language.$}");
    // // print("new splash screen app_language_rtl ${app_language_rtl.$}");

    // return app_mobile_language.$;
  }
}
