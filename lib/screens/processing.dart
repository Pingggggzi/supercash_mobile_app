import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/facialRecogition.dart';

class ProcessingPage extends StatefulWidget {
  const ProcessingPage({Key? key}) : super(key: key);

  @override
  State<ProcessingPage> createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => FacialRecognition()));
            }),
        title: Text("Wait for a wile..."),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: ListView(children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Processing',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.rotate_right,
                      color: Colors.grey,
                      size: 60,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Connecting to online verification service. Please do not close this app',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'powered by',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      ' cto',
                      style: TextStyle(
                          color: Color.fromARGB(255, 3, 84, 95), fontSize: 18),
                    ),
                    Text(
                      's',
                      style: TextStyle(color: Colors.red[900], fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.copyright,
                      color: Colors.white,
                      size: 14,
                    ),
                    Text(
                      ' Copyright CTOS Data Systems Sdn Bhd. All Rrights Reserved.',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ]),
            ),
          ])),
    );
  }
}
