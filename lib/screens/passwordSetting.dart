import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/settingsPage.dart';

import '../widgets/passwordTextFormField.dart';

class Passwordsetting extends StatefulWidget {
  @override
  State<Passwordsetting> createState() => _PasswordsettingState();
}

bool obserText = true;
final TextEditingController password = TextEditingController();
final TextEditingController newPassword = TextEditingController();

class _PasswordsettingState extends State<Passwordsetting> {
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
        title: Text("Settings"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Password Change',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '*To change password please enter current password and new password',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.black26),
                    left: BorderSide(color: Colors.black26),
                    right: BorderSide(color: Colors.black26)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 320,
                        child: PasswordTextFormField(
                          obserText: obserText,
                          controller: password,
                          name: "Enter Password",
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              obserText = !obserText;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'New Password',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 320,
                        child: PasswordTextFormField(
                          obserText: obserText,
                          controller: newPassword,
                          name: "Enter New Password",
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              obserText = !obserText;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      RaisedButton(
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Color.fromRGBO(50, 75, 205, 1),
                          onPressed: () {})
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
