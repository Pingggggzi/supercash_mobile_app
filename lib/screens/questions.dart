import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/facialRecogition.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
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
        title: Text("Verification"),
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
                      'Your identity has been verified',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CTOS ID account successfully verified. You may continue using CTOS ID from your computer.',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Click here or wait for 7 seconds to redirect.',
                          style: TextStyle(
                              color: Color.fromARGB(255, 107, 227, 237),
                              decoration: TextDecoration.underline,
                              fontSize: 15),
                        ))
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
                Text(
                  '@ Copyright CTOS Data Systems Sdn Bhd. All Rrights Reserved.',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              ]),
            ),
          ])),
    );
  }
}
