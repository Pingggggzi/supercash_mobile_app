import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supercash_mobile_app/screens/eKYCPage.dart';
import 'package:supercash_mobile_app/screens/processing.dart';
import 'package:supercash_mobile_app/screens/questions.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class FacialRecognition extends StatefulWidget {
  const FacialRecognition({Key? key}) : super(key: key);

  @override
  State<FacialRecognition> createState() => _FacialRecognitionState();
}

class _FacialRecognitionState extends State<FacialRecognition> {
  PickedFile? _videoFile;
  final ImagePicker _picker = ImagePicker();

  _record(ImageSource source) async {
    final pickedFile = await _picker.getVideo(source: source);

    if (pickedFile != null) {
      setState(() {
        _videoFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => eKYCPage()));
            }),
        title: Text("Facial Recognition"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
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
              decoration: BoxDecoration(color: Colors.grey[900]),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
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
                    padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                    height: 240,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Container(
                      child: _videoFile == null
                          ? Image(image: AssetImage('images/user.png'))
                          : FittedBox(
                              fit: BoxFit.contain,
                              child: mounted
                                  ? Chewie(
                                      controller: ChewieController(
                                        videoPlayerController:
                                            VideoPlayerController.file(
                                                File(_videoFile!.path)),
                                        aspectRatio: 3 / 2,
                                        autoPlay: true,
                                        looping: true,
                                      ),
                                    )
                                  : Container(),
                            ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(80, 0, 80, 30),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 4, 76, 84)),
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.videocam,
                            color: Color.fromARGB(255, 107, 227, 237),
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Start Recording',
                            style: TextStyle(
                                color: Color.fromARGB(255, 107, 227, 237),
                                fontSize: 18),
                          ),
                        ],
                      ),
                      onPressed: () {
                        _record(ImageSource.camera);
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
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
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(90, 70, 90, 45),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => ProcessingPage()));
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 46, 55)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Color.fromARGB(255, 35, 73, 80)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
