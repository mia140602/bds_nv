import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:lottie/lottie.dart';

// #docregion platform_imports
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../my_theme.dart';

// #enddocregion platform_imports

class SalaryReportScreen extends StatefulWidget {
  const SalaryReportScreen({super.key});

  @override
  State<SalaryReportScreen> createState() => _SalaryReportScreenState();
}

class _SalaryReportScreenState extends State<SalaryReportScreen> {
  late final WebViewController _controller;
  int websiteProgress = 0;
  Future<bool> _exitApp(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              websiteProgress = progress;
            });
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            _controller.runJavaScript(
                'document.querySelector("header").style.display="none";');
            _controller.runJavaScript(
                'document.querySelector("footer").style.display="none";');
            // Ẩn phần tử <section class="content-header">
            _controller.runJavaScript(
                'document.querySelector(".content-header").style.display="none";');

            _controller.runJavaScript("""
  document.querySelector('.content-wrapper').style.backgroundColor = '#fff';
""");
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(
          Uri.parse('https://home.designweb.top/e_dashboard/e_report.php'));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Stack(
          children: [
            WebViewWidget(controller: _controller),
            Positioned.fill(
              child: Visibility(
                visible: websiteProgress < 50,
                child: Container(
                  color: Colors.white54,
                  child: Lottie.asset(
                    "assets/loading.json",
                    frameRate: FrameRate.max,
                    repeat: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget favoriteButton() {
    return FloatingActionButton(
      onPressed: () async {
        final String? url = await _controller.currentUrl();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Favorited $url')),
          );
        }
      },
      child: const Icon(Icons.favorite),
    );
  }

  buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(84.0),
      child: AppBar(
          backgroundColor: MyTheme.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
            child: Column(
              children: [
                Padding(
                  padding: MediaQuery.of(context).viewPadding.top >
                          30 //MediaQuery.of(context).viewPadding.top is the statusbar height, with a notch phone it results almost 50, without a notch it shows 24.0.For safety we have checked if its greater than thirty
                      ? const EdgeInsets.only(top: 36.0)
                      : const EdgeInsets.only(top: 14.0),
                  child: buildTopAppBarContainer(),
                ),
                // buildBottomAppBar(context)
              ],
            ),
          )),
    );
  }

  Container buildTopAppBarContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) => IconButton(
              padding: EdgeInsets.only(left: 20, top: 10),
              icon: Icon(
                Icons.arrow_back,
                color: MyTheme.accent_color,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Text(
            "Báo cáo lương",
            style: TextStyle(
                fontSize: 16,
                color: MyTheme.dark_font_grey,
                fontWeight: FontWeight.bold),
          ),
          Container(
            width: 60,
          )
        ],
      ),
    );
  }
}
