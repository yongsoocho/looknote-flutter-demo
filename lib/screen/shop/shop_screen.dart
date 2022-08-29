import 'package:flutter/material.dart';
import 'package:looknote/app/components/loading/common_loading.dart';
import 'package:looknote/app/constants/app_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  bool isLoading = true;
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            WebView(
              key: _key,
              initialUrl: coinShopUrl,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading
                ? const Center(
                    child: CommonLoading()
                  )
                : Stack(),
          ],
        ),
      ),
    );
  }
}
