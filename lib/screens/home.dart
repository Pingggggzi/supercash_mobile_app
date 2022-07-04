import 'package:flutter/material.dart';

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
      ),
    );
  }

  bool homeColor = true;
  bool profileColor = false;
  bool jobprogressColor = false;
  bool jobsColor = false;
  bool settingColor = false;

  Widget _buildMyDrawer() {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 52, 58, 64),
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        // CircleAvatar(
                        //   radius: 30,
                        //   backgroundImage: _imageFile == null
                        //       ? AssetImage("images/User.jpg") as ImageProvider
                        //       : FileImage(File(_imageFile!.path)),
                        // ),
                        // Positioned(
                        //     bottom: 4,
                        //     right: 2,
                        //     child: InkWell(
                        //       onTap: () {
                        //         showModalBottomSheet(
                        //           context: context,
                        //           builder: ((builder) => bottomSheet()),
                        //         );
                        //       },
                        //       child: Icon(
                        //         Icons.camera_alt,
                        //         color: Color.fromRGBO(50, 75, 205, 1),
                        //         size: 20,
                        //       ),
                        //     ))
                      ],
                    ),
                    // CircleAvatar(
                    //   radius: 30,
                    //   backgroundImage: AssetImage("images/Emma.jpg"),
                    // ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Email address",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                )),
            ListTile(
              selected: homeColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  profileColor = false;
                  jobprogressColor = false;
                  jobsColor = false;
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
                  jobprogressColor = false;
                  jobsColor = false;
                  settingColor = false;
                });
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx) => Profile()));
              },
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              selected: jobprogressColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  profileColor = false;
                  jobprogressColor = false;
                  jobsColor = false;
                  settingColor = false;
                });
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx) => Jobprogress()));
              },
              leading: Icon(Icons.pending_actions),
              title: Text("Job Progress"),
            ),
            ListTile(
              selected: jobsColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  profileColor = false;
                  jobprogressColor = false;
                  jobsColor = false;
                  settingColor = false;
                });
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx) => Jobs()));
              },
              leading: Icon(Icons.work),
              title: Text("Jobs"),
            ),
            ListTile(
              selected: settingColor,
              onTap: () {
                setState(() {
                  homeColor = true;
                  profileColor = false;
                  jobprogressColor = false;
                  jobsColor = false;
                  settingColor = false;
                });
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx) => Setting()));
              },
              leading: Icon(Icons.settings),
              title: Text("Setting"),
            ),
            ListTile(
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (ctx) => Dashboard()));
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
