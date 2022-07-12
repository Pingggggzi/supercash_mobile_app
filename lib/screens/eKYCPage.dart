import 'dart:io';

import 'package:cnic_scanner/cnic_scanner.dart';
import 'package:cnic_scanner/model/cnic_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supercash_mobile_app/screens/eKYCSample.dart';
import 'package:supercash_mobile_app/screens/facialRecogition.dart';
import 'package:supercash_mobile_app/screens/settingsPage.dart';

class eKYCPage extends StatefulWidget {
  const eKYCPage({Key? key}) : super(key: key);

  @override
  State<eKYCPage> createState() => _eKYCPageState();
}

class _eKYCPageState extends State<eKYCPage> {
  File? imageFrontID;
  File? imageBackID;

  CnicModel _pickFrontID = CnicModel();
  CnicModel _pickBackID = CnicModel();
  Future pickFrontID(ImageSource source) async {
    // final imageFrontID = await ImagePicker().pickImage(source: source);
    CnicModel imageFrontID = await CnicScanner().scanImage(imageSource: source);

    if (imageFrontID == null) return;

    // final imageFrontIDTemporary = File(imageFrontID.path);

    setState(() {
      _pickFrontID = imageFrontID;
    });
  }

  Future pickBackID(ImageSource source) async {
    // final imageBackID = await ImagePicker().pickImage(source: source);
    CnicModel imageBackID = await CnicScanner().scanImage(imageSource: source);
    if (imageBackID == null) return;

    // final imageBackIDTemporary = File(imageBackID.path);
    setState(() {
      // this.imageBackID = imageBackIDTemporary;
      _pickBackID = imageBackID;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text("eKYC"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[900]),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Take a photo of your NRIC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    '(Front & Back)',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'See',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => eKYCSamples()));
                    },
                    child: Text(
                      'take photo samples',
                      style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline),
                    ))
              ]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Front NRIC',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                          color: Color.fromARGB(255, 219, 213, 213),
                          width: 5.0)),
                  child: imageFrontID != null
                      ? Image.file(
                          imageFrontID!,
                          fit: BoxFit.cover,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Color.fromARGB(255, 23, 162, 184),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet1()));
                          },
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Back NRIC',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                          color: Color.fromARGB(255, 219, 213, 213),
                          width: 5.0)),
                  child: imageBackID != null
                      ? Image.file(
                          imageBackID!,
                          fit: BoxFit.cover,
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Color.fromARGB(255, 23, 162, 184),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet2()));
                          },
                        ),
                ),
              ],
            ),
            Container(
              height: 50,
              margin: EdgeInsets.fromLTRB(90, 45, 90, 45),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => FacialRecognition()));
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

  Widget bottomSheet1() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose To Take / Uplod Image',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () {
                  // onGalleryBTNPressed:
                  // () {
                  //   scanCnic(ImageSource.gallery);
                  // };
                  pickFrontID(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              ),
              FlatButton.icon(
                onPressed: () {
                  // OnCameraBTNPressed:
                  // () {
                  //   scanCnic(ImageSource.camera);
                  // };
                  pickFrontID(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt),
                label: Text('Camera'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomSheet2() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose To Take / Uplod Image',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () {
                  pickBackID(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              ),
              FlatButton.icon(
                onPressed: () {
                  pickBackID(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt),
                label: Text('Camera'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
