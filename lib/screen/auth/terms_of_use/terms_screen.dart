import 'package:flutter/material.dart';
import 'package:looknote/app/components/app_bar/look_note_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsScreen extends StatelessWidget {
  final String title;
  final String url;

  const TermsScreen({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LookNoteAppBar(
        title: title,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: _url,
        builder: (context, snapshot) => snapshot.hasData
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: WebView(
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
      backgroundColor: Colors.white,
    );
  }

  Future<String> get _url async {
    await Future.delayed(const Duration(seconds: 1));
    return url;
  }
}
