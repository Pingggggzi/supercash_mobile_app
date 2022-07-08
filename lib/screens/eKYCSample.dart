import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/eKYCPage.dart';
import 'package:supercash_mobile_app/screens/settingsPage.dart';

class eKYCSamples extends StatefulWidget {
  const eKYCSamples({Key? key}) : super(key: key);

  @override
  State<eKYCSamples> createState() => _eKYCSamplesState();
}

class _eKYCSamplesState extends State<eKYCSamples> {
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
        title: Text("Samples"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[900]),
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
              padding: EdgeInsets.all(10),
              child: Text(
                "Let's get started with your identity verification",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Take a photo of your NRIC\n(Front & Back)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Correct',
                    style: TextStyle(color: Colors.green[400], fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'images/testSample.jpg',
                        ),
                        width: 190,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage(
                          'images/testSample.jpg',
                        ),
                        width: 190,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.fact_check,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Clearly show all information on NRIC',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Wrong',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'images/testSample.jpg',
                        ),
                        width: 190,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        image: AssetImage(
                          'images/testSample.jpg',
                        ),
                        width: 190,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.block,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Avoid glare and reflection on NRIC',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.block,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Avoid other information such as watermark',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => eKYCPage()));
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 0, 46, 55)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          side: MaterialStateProperty.all(BorderSide(
                              color: Color.fromARGB(255, 35, 73, 80)))),
                    ),
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
