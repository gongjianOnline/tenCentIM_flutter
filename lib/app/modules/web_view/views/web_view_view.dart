import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';

import '../controllers/web_view_controller.dart';

class WebViewView extends GetView<WebViewController> {
  const WebViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      body: Container(
        width: MediaQuery. of (context).size.width,
        child: Column(
          children: [
            Text(controller.url.value),
            Expanded(
              flex: 1,
              child: InAppWebView(
                initialUrlRequest:URLRequest(
                  url:Uri.parse("https://gjweb.top/")
                ),
              ),
            )
          ],
        )
      )
      ));
  }
}
