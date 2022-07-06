import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/settingsPage.dart';

class eKYCPage extends StatefulWidget {
  const eKYCPage({Key? key}) : super(key: key);

  @override
  State<eKYCPage> createState() => _eKYCPageState();
}

class _eKYCPageState extends State<eKYCPage> {
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
        title: Text("eKYC"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
    );
  }
}
