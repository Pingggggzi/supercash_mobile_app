import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/addBrrower.dart';
import 'package:supercash_mobile_app/screens/ekycWeb.dart';
import 'package:supercash_mobile_app/screens/facialRecogition.dart';
import 'package:supercash_mobile_app/screens/home.dart';
import 'package:supercash_mobile_app/screens/questions.dart';
import 'package:supercash_mobile_app/screens/signup.dart';
import 'package:supercash_mobile_app/screens/verified.dart';
import 'package:supercash_mobile_app/widgets/borrowerForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
