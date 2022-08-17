import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercash_mobile_app/screens/home.dart';
import 'package:supercash_mobile_app/screens/login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/changeScreen.dart';
import '../widgets/myTextFormField.dart';
import '../widgets/mybutton.dart';
import '../widgets/passwordTextFormField.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<ScaffoldState> _scaffoldKeyEmployer =
    GlobalKey<ScaffoldState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController confirmationPassword = TextEditingController();
final TextEditingController NRIC = TextEditingController();
final TextEditingController firstName = TextEditingController();
final TextEditingController lastName = TextEditingController();
final TextEditingController phoneNumber = TextEditingController();
final TextEditingController houseAddress = TextEditingController();

final TextEditingController companyName = TextEditingController();

final TextEditingController year = TextEditingController();
final TextEditingController position = TextEditingController();
final TextEditingController monthlySalary = TextEditingController();
final TextEditingController supervisorName = TextEditingController();
final TextEditingController supervisorContact = TextEditingController();

class _SignUpState extends State<SignUp> {
  String? joinedMonth;
  String? companySector;
  String gender = 'Male';
  DateTime date = DateTime(2022, 07, 05);

  final List listCompanySector = ['list1', 'list2'];
  final List listJoinedMonth = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  void submit() async {
    try {
      setState(() {
        isLoading = true;
      });
    } on PlatformException catch (error) {
      var message = "Please Check Your Internet Connection ";
      if (error.message != null) {
        message = error.message!;
      }
      _scaffoldKeyEmployer.currentState!.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      _scaffoldKeyEmployer.currentState!.showSnackBar(SnackBar(
        content: Text(error.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));

      print(error);
    }

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => Homepage()));
    setState(() {
      isLoading = false;
    });
  }

  void vaildation() async {
    if (email.text.isEmpty &&
        password.text.isEmpty &&
        confirmationPassword.text.isEmpty &&
        firstName.text.isEmpty &&
        lastName.text.isEmpty &&
        companyName.text.isEmpty &&
        year.text.isEmpty &&
        position.text.isEmpty &&
        monthlySalary.text.isEmpty &&
        supervisorName.text.isEmpty &&
        supervisorContact.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("All flied are empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("Email is empty"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("Please try vaild email"),
        ),
      );
    } else if (password.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password is empty"),
        ),
      );
    } else if (password.text.length < 8) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("Password  is too short"),
        ),
      );
    } else if (confirmationPassword.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("Confirmation password is empty"),
        ),
      );
    } else if (confirmationPassword.value != password.value) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("The password confirmation does not match"),
        ),
      );
    } else if (firstName.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("First name is empty"),
        ),
      );
    } else if (lastName.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text("Last Name is empty "),
        ),
      );
    } else if (companyName.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Company Name is empty'),
        ),
      );
    } else if (year.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Joined Year is empty'),
        ),
      );
    } else if (position.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Position is empty'),
        ),
      );
    } else if (monthlySalary.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Monthly Salary is empty'),
        ),
      );
    } else if (supervisorName.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Supervisor Name is empty'),
        ),
      );
    } else if (supervisorContact.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Supervisor Contact is empty'),
        ),
      );
    } else {
      submit();
    }
  }

  Widget _buildAllTextFormFieldBasic() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: "Email",
            controller: email,
          ),
          SizedBox(
            height: 10,
          ),
          PasswordTextFormField(
            obserText: obserText,
            controller: password,
            name: "Password",
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          PasswordTextFormField(
            obserText: obserText,
            controller: confirmationPassword,
            name: "Confirmation Password",
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "NRIC Eg.000000112222",
            controller: NRIC,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "First Name",
            controller: firstName,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "Last Name",
            controller: lastName,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                'Gender :',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  Text(
                    'Male',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) {
                      gender = value.toString();
                    },
                  ),
                  Text(
                    'Female',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Birth Date : ',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    Text(
                      '${date.year}/${date.month}/${date.day}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                      // builder: ((context, child) {
                      //   return Theme(data: ThemeData(
                      //     cardColor: Colors.red
                      //   ), child: child,)
                      // }),
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );

                    if (newDate == null) return;

                    setState(() => date = newDate);
                  },
                  icon: Icon(Icons.date_range),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "Phone Number",
            controller: phoneNumber,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "House Address",
            controller: houseAddress,
          ),
        ],
      ),
    );
  }

  Widget _buildAllTextFormFieldCompany() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFormField(controller: companyName, name: 'Company Name'),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    DropdownButton(
                      hint: Text(
                        "Company Sector",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      value: companySector,
                      onChanged: (val) {
                        setState(() {
                          companySector = val as String;
                        });
                      },
                      items: listCompanySector.map((valueCompanySector) {
                        return DropdownMenuItem(
                          value: valueCompanySector,
                          child: Text(valueCompanySector),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 60,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    DropdownButton(
                      hint: Text(
                        "Joined Month",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      value: joinedMonth,
                      onChanged: (val) {
                        setState(() {
                          joinedMonth = val as String;
                        });
                      },
                      items: listJoinedMonth.map((valueJoinedMonth) {
                        return DropdownMenuItem(
                          value: valueJoinedMonth,
                          child: Text(valueJoinedMonth),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(controller: year, name: 'Eg.2022'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextFormField(controller: position, name: 'Position'),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(
                  controller: monthlySalary, name: 'Monthly Salary'),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(
                  controller: supervisorName, name: 'Supervisor Name'),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(
                  controller: supervisorContact, name: 'Supervisor Contact'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoPart() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormFieldBasic(),
        ],
      ),
    );
  }

  Widget _buildCurrentJobPart() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAllTextFormFieldCompany(),
          SizedBox(
            height: 10,
          ),
          isLoading == false
              ? MyButton(
                  name: "Register",
                  onPressed: () {
                    vaildation();
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
          ChangeScreen(
            name: "Login",
            whichAccount: "Register Already?",
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyEmployer,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => Login()));
                    },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
          ),
          Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Basic Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 750,
            child: _buildBasicInfoPart(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Current Job',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 750,
            child: _buildCurrentJobPart(),
          ),
        ],
      ),
    );
  }
}
