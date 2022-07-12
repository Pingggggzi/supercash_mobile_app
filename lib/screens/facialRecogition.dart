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
        child: ListView(),
      ),
    );
  }
}
