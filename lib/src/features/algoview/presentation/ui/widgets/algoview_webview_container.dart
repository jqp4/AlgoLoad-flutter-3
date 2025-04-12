import 'package:algoload_flutter_web_app/src/core/_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AlgoViewWebViewContainer extends StatelessWidget {
  const AlgoViewWebViewContainer({
    required this.algoViewFullUrl,
    super.key,
  });

  final String algoViewFullUrl;

  static final _log = MyWebLogger('algoview_webview_container');

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(algoViewFullUrl),
              ),
              onWebViewCreated: (controller) async {
                _log.fine('onWebViewCreated');
              },
              onLoadStart: (controller, url) {
                _log.fine('onLoadStart: $url');
              },
              onLoadStop: (controller, url) async {
                _log.fine('onLoadStop: $url');
              },
              onProgressChanged: (controller, progress) {
                _log.fine('onProgressChanged: $progress');
              },
            ),
          ),
        ),
      ),
    );
  }
}
