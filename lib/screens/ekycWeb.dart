import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/settingsPage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class ekycWeb extends StatefulWidget {
  const ekycWeb({Key? key}) : super(key: key);

  @override
  State<ekycWeb> createState() => _ekycWebState();
}

class _ekycWebState extends State<ekycWeb> {
  late WebViewController controller;

  getData() async {
    var response = await http.get(Uri.https('ekyc.ctos.com.my',
        'https://ekyc.ctos.com.my/#/guideline?token=9a57f93ce230147b4f0b83c29029224d62021021'));
    var jsonData = jsonDecode(response.body);
  }

  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    } else if (Platform.isIOS) {}
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Settings()));
            }),
        title: Text("eKYC Verification"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://uat-eonboarding.ctos.com.my/cgw/#/error?token=8983e438a81d724c97286c3ba4026d08superceedref_id_18_1660643868',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),
    );
  }
}
