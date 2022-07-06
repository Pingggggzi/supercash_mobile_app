import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/login.dart';
import 'package:supercash_mobile_app/screens/settingsPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
        title: Text(
          "Home",
          style: TextStyle(fontSize: 18.0),
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
  bool profileColor = false;

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
                'SuperCash',
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
                  profileColor = false;

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
              selected: profileColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  profileColor = false;

                  settingColor = false;
                });
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx) => Profile()));
              },
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              selected: settingColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  profileColor = false;

                  settingColor = false;
                });
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => Settings()));
              },
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => Login()));
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
