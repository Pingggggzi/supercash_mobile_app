import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/adminLogin.dart';
import 'package:supercash_mobile_app/screens/borrower.dart';

import 'login.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        leading: RoundedIconButton(
          iconData: Icons.menu,
          press: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Home",
              style: TextStyle(fontSize: 18.0),
            ),
            Row(
              children: [
                Text(
                  'Admin',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down))
              ],
            )
          ],
        ),
        bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              children: [],
            ),
          ),
          preferredSize: Size.fromHeight(15),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }

  bool homeColor = true;
  bool borrowerColor = false;
  bool loanColor = false;
  bool settingColor = false;

  Widget _buildMyDrawer() {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 52, 58, 64),
        child: ListView(
          children: <Widget>[
            // SizedBox(
            //   height: 80,
            // ),
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Text(
                'IWC PERFORMANCE',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey[200],
                    fontStyle: FontStyle.italic),
              ),
            ),
            ListTile(
              selected: homeColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  borrowerColor = false;
                  loanColor = false;
                  settingColor = false;
                });
              },
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              selected: borrowerColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  borrowerColor = false;
                  loanColor = false;
                  settingColor = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => Borrower()));
              },
              leading: Icon(Icons.group),
              title: Text("Borrower"),
            ),
            ListTile(
              selected: loanColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  borrowerColor = false;
                  loanColor = false;
                  settingColor = false;
                });
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx) => Borrower()));
              },
              leading: Icon(Icons.request_quote),
              title: Text("Loans"),
            ),
            ListTile(
              selected: settingColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  borrowerColor = false;
                  loanColor = false;
                  settingColor = false;
                });
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx) => Settings()));
              },
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => AdminLogin()));
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }

  RoundedIconButton(
      {required IconData iconData, required Null Function() press}) {}
}
