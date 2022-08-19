import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/models/post.dart';
import 'package:supercash_mobile_app/screens/eKYCPage.dart';
import 'package:supercash_mobile_app/screens/ekycWeb.dart';
import 'package:supercash_mobile_app/screens/home.dart';
import 'package:supercash_mobile_app/screens/passwordSetting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// class Post {
//   final String api_key;
//   final String package_name;
//   final String ref_id;
//   final String signature;
//   final String onboarding_id;
//   final String onboarding_url;
//   // Timestamp expired_at;
//   final DateTime expired_at;
//   final String error_code;

//   const Post({
//     required this.api_key,
//       required this.package_name,
//       required this.ref_id,
//       required this.signature,
//       required this.onboarding_id,
//       required this.onboarding_url,
//       required this.expired_at,
//       required this.error_code
//   });
// }

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  String? valueChoose;
  List listItem = ['English', '中文'];
  late Post post;

  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    post = await Post.connectToAPI(
        'api_key',
        'package_name',
        'ref_id',
        'signature',
        ' onboarding_id',
        'https://ekyc.ctos.com.my/#/guideline?token=9a57f93ce230147b4f0b83c29029224d62021021',
        '2020-04-17 14:14:17',
        'error_code');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Homepage()));
            }),
        title: Text("Setting Page"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  DropdownButton(
                    hint: Text(
                      "Language",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                    underline: SizedBox(),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    value: valueChoose,
                    onChanged: (val) {
                      setState(() {
                        valueChoose = val as String;
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Password Settings',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => Passwordsetting()));
                    },
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'eKYC',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 18,
                        ),
                        Text(
                          'Please complete the eKYC to get verified',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      size: 25,
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (ctx) => ekycWeb()));
                    },
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 70,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'CTOS eKYC',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      size: 25,
                    ),
                    onPressed: () {
                      getData();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => ekycWeb()));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
