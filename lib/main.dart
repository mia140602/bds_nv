import 'dart:io';
import 'package:bds_nv/views/screen/sc_navigation.dart';
import 'package:bds_nv/views/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_value/shared_value.dart';
import 'app_config.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';
import 'my_theme.dart';
import 'providers/locale_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = _MyHttpOverrides();
  // FlutterDownloader.initialize(
  //     debug: true,
  //     // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // AddonsHelper().setAddonsData();
  // BusinessSettingHelper().setBusinessSettingData();
  // app_language.load();
  // app_mobile_language.load();
  // app_language_rtl.load();
  //
  // access_token.load().whenComplete(() {
  //   AuthHelper().fetch_and_set();
  // });

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  runApp(
    SharedValue.wrapApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // handleDeepLink(context);

    // Future.delayed(Duration.zero).then(
    //   (value) async {
    //     Firebase.initializeApp().then((value) {
    //       if (OtherConfig.USE_PUSH_NOTIFICATION) {
    //         Future.delayed(Duration(milliseconds: 10), () async {
    //           PushNotificationService().initialise();
    //         });
    //       }
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ],
        child: Consumer<LocaleProvider>(builder: (context, provider, snapshot) {
          return MaterialApp(
            initialRoute: "/",
            routes: {
              "/": (context) => SplashScreen(),
            },
            builder: OneContext().builder,
            navigatorKey: OneContext().navigator.key,
            title: AppConfig.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: MyTheme.white,
              scaffoldBackgroundColor: MyTheme.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              /*textTheme: TextTheme(
              bodyText1: TextStyle(),
              bodyText2: TextStyle(fontSize: 12.0),
            )*/
              //
              // the below code is getting fonts from http
              textTheme: GoogleFonts.publicSansTextTheme(textTheme).copyWith(
                bodyText1:
                    GoogleFonts.publicSans(textStyle: textTheme.bodyText1),
                bodyText2: GoogleFonts.publicSans(
                    textStyle: textTheme.bodyText2, fontSize: 12),
              ),
            ),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            locale: provider.locale,
            supportedLocales: L10n.all,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              if (AppLocalizations.delegate.isSupported(deviceLocale!)) {
                return deviceLocale;
              }
              return const Locale('vi');
            },
            //home: SplashScreen(),
            // home: Splash(),
          );
        }));
  }
}

class _MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
