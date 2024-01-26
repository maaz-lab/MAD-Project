import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../widgets/app_bar/my_app_bar.dart';

class WebViewScreen extends StatelessWidget {
  final String? url, newsLogo;

  WebViewScreen({super.key, this.url, this.newsLogo});

  final WebViewController controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          debugPrint('loading webview: $progress');
        },
      ))
      ..loadRequest(Uri.parse(url ?? "https://google.com"));

    return Scaffold(
      appBar: MyAppBar(
        image: newsLogo,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
