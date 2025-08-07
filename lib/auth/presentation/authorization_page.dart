import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:re_so_fl_ttr/auth/infrastructure/github_authenticator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

@RoutePage()
class AuthorizationPage extends StatefulWidget {
  final Uri authorizationUrl;
  final void Function(Uri redirectUrl) onAuthorizationRedirectAttempt;

  const AuthorizationPage({
    super.key,
    required this.authorizationUrl,
    required this.onAuthorizationRedirectAttempt,
  });

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  late final WebViewController _controller;

  final platform = WebViewPlatform.instance;

  @override
  void initState() {
    super.initState();
    _initializeWebViewController();
    _clearCookiesAndCache();
  }

  Future<void> _clearCookiesAndCache() async {
    try {
      await _controller.clearCache();
      final cookieManager = WebViewCookieManager();
      await cookieManager.clearCookies();
      debugPrint('Cookies cleared successfully');
    } catch (e) {
      debugPrint('Error clearing cookies: $e');
    }
  }

  void _initializeWebViewController() {
    late final PlatformWebViewControllerCreationParams params;

    if (platform is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final controller = WebViewController.fromPlatformCreationParams(params)
      ..clearCache()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            debugPrint('Navigating to: ${request.url}');

            if (request.url.startsWith(
              GithubAuthenticator.redirectUrl.toString(),
            )) {
              widget.onAuthorizationRedirectAttempt(Uri.parse(request.url));
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (change) {
            debugPrint('URL changed to: ${change.url}');
          },
        ),
      );

    if (controller.platform is AndroidWebViewController) {
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;

    // Загружаем URL после инициализации
    _controller.loadRequest(widget.authorizationUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Authorization')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
