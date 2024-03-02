var thisYear = DateTime.now().year.toString();

class AppConfig {
  static String copyrightText =
      "@ ActiveItZone " + thisYear; //this shows in the splash screen
  static String appName = "YHouse employee"; //this shows in the splash screen
  static String purchaseCode =
      "805c7e93-eb89-4705-8cea-e727ee062317"; //enter your purchase code for the app from codecanyon
  //static String purchase_code = ""; //enter your purchase code for the app from codecanyon

  //Default language config
  static String defaultLanguage = "vi";
  static String mobileAppCode = "vi";
  static bool appLanguageRTL = false;

  //configure this
  static const bool HTTPS = true;

  static const DOMAIN_PATH = "hasumart.online"; //localhost
  // 192.168.1.177/hasumart.online%20%283%29
  //do not configure these below
  static const String API_ENDPATH = "api/v2";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "$PROTOCOL$DOMAIN_PATH";
  // static const String BASE_URL = "$RAW_BASE_URL/$API_ENDPATH";
  static const String BASE_URL = "https://home.designweb.top/";

  @override
  String toString() {
    return super.toString();
  }
}
