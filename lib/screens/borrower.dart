import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/adminHome.dart';

class Borrower extends StatefulWidget {
  const Borrower({Key? key}) : super(key: key);

  @override
  State<Borrower> createState() => _BorrowerState();
}

class _BorrowerState extends State<Borrower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => AdminHome()));
            }),
        title: Text("Borrower List"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
    );
  }
}
