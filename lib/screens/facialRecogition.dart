import 'package:flutter/material.dart';

class FacialRecognition extends StatefulWidget {
  const FacialRecognition({Key? key}) : super(key: key);

  @override
  State<FacialRecognition> createState() => _FacialRecognitionState();
}

class _FacialRecognitionState extends State<FacialRecognition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text("Facial Recognition"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[900]),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'cto',
                    style: TextStyle(
                        color: Color.fromARGB(255, 3, 84, 95),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    's',
                    style: TextStyle(
                        color: Colors.red[900],
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                Text(
                  'Record a 4 seconds selfie video',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '1.Enable video capture permission',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  "2.Tap 'Start Recording' when ready",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            ),
            Container(
              margin: EdgeInsets.all(100),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.record_voice_over,
                      color: Color.fromARGB(255, 107, 227, 237),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Start Recording',
                      style: TextStyle(
                        color: Color.fromARGB(255, 107, 227, 237),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
