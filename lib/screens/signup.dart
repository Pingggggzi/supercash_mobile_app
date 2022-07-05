import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercash_mobile_app/screens/home.dart';
import 'package:supercash_mobile_app/screens/login.dart';

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
final TextEditingController role = TextEditingController();
final TextEditingController companyName = TextEditingController();
final TextEditingController registerNo = TextEditingController();
final TextEditingController address = TextEditingController();
final TextEditingController postcode = TextEditingController();
final TextEditingController addressOffice = TextEditingController();
final TextEditingController postcodeOffice = TextEditingController();
final TextEditingController phoneOffice = TextEditingController();
final TextEditingController emailOffice = TextEditingController();

class _SignUpState extends State<SignUp> {
  String? country;
  String? state;
  String? city;
  String? countryOffice;
  String? stateOffice;
  String? cityOffice;
  final List listCountry = ['Malaysia', 'China'];
  final List listStateMY = [
    'Johor',
    'Kedah',
    'Kelantan',
    'Kuala Lumpur',
    'Labuan',
    'Melaka',
    'Negeri Sembilan',
    'Pahang',
    'Perak',
    'Perlis',
    'Pulau Pinang',
    'Sabah',
    'Sarawak',
    'Selangor',
    'Terengganu'
  ];
  final List listStateCN = [
    'Anhui',
    'Beijing',
    'Chongqing',
    'Fujian',
    'Guangdong',
    'Gansu',
    'Guangxi',
    'Guizhou',
    'Henan',
    'Hubei',
    'Hebei',
    'Hainan',
    'Hong Kong',
    'Heilongjiang',
    'Hunan',
    'Jilin',
    'Jiangsu',
    'Jiangxi',
    'Liaoning',
    'Macao',
    'Inner Mongolia',
    'Ningxia Hui',
    'Qinghai',
    'Sichuan',
    'Shandong',
    'Shanghai',
    'Shaanxi',
    'Shanxi',
    'Tianjin',
    'Taiwan',
    'Xinjiang Uyghur',
    'Tibet',
    'Yunnan',
    'Zhejiang'
  ];
  List listState = [];
  List listCity = [];
  final List listCountryOffice = ['Malaysia', 'China'];
  final List listStateMYOffice = [
    'Johor',
    'Kedah',
    'Kelantan',
    'Kuala Lumpur',
    'Labuan',
    'Melaka',
    'Negeri Sembilan',
    'Pahang',
    'Perak',
    'Perlis',
    'Pulau Pinang',
    'Sabah',
    'Sarawak',
    'Selangor',
    'Terengganu'
  ];
  final List listStateCNOffice = [
    'Anhui',
    'Beijing',
    'Chongqing',
    'Fujian',
    'Guangdong',
    'Gansu',
    'Guangxi',
    'Guizhou',
    'Henan',
    'Hubei',
    'Hebei',
    'Hainan',
    'Hong Kong',
    'Heilongjiang',
    'Hunan',
    'Jilin',
    'Jiangsu',
    'Jiangxi',
    'Liaoning',
    'Macao',
    'Inner Mongolia',
    'Ningxia Hui',
    'Qinghai',
    'Sichuan',
    'Shandong',
    'Shanghai',
    'Shaanxi',
    'Shanxi',
    'Tianjin',
    'Taiwan',
    'Xinjiang Uyghur',
    'Tibet',
    'Yunnan',
    'Zhejiang'
  ];
  List listStateOffice = [];
  List listCityOffice = [];

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
        registerNo.text.isEmpty &&
        address.text.isEmpty &&
        postcode.text.isEmpty &&
        addressOffice.text.isEmpty &&
        postcodeOffice.text.isEmpty &&
        phoneOffice.text.isEmpty &&
        emailOffice.text.isEmpty) {
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
    } else if (registerNo.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Registration No is empty'),
        ),
      );
    } else if (address.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Registered Address is empty'),
        ),
      );
    } else if (postcode.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Postcode of Registered Address is empty'),
        ),
      );
    } else if (addressOffice.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Company Address is empty'),
        ),
      );
    } else if (postcodeOffice.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Postcode of Company Address is empty'),
        ),
      );
    } else if (phoneOffice.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Company Phone is empty'),
        ),
      );
    } else if (emailOffice.text.isEmpty) {
      _scaffoldKeyEmployer.currentState!.showSnackBar(
        SnackBar(
          content: Text('Company Email is empty'),
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
          MyTextFormField(controller: registerNo, name: 'Registration No'),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Registered Address',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              MyTextFormField(controller: address, name: 'Address'),
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
                        "Select Country",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      value: country,
                      onChanged: (val) {
                        state = null;
                        listState =
                            val == 'Malaysia' ? listStateMY : listStateCN;
                        setState(() {
                          country = val as String;
                        });
                      },
                      items: listCountry.map((valueCountry) {
                        return DropdownMenuItem(
                          value: valueCountry,
                          child: Text(valueCountry),
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
                        "Select State",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      value: state,
                      onChanged: (val) {
                        setState(() {
                          state = val as String;
                        });
                      },
                      items: listState.map((valueState) {
                        return DropdownMenuItem(
                          value: valueState,
                          child: Text(valueState),
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
                        "Select City",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      value: city,
                      onChanged: (val) {
                        setState(() {
                          city = val as String;
                        });
                      },
                      items: listCity.map((valueCity) {
                        return DropdownMenuItem(
                          value: valueCity,
                          child: Text(valueCity),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(controller: postcode, name: 'Postcode'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Office Address',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              MyTextFormField(controller: addressOffice, name: 'Address'),
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
                        "Select Country",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      value: countryOffice,
                      onChanged: (val) {
                        state = null;
                        listStateOffice = val == 'Malaysia'
                            ? listStateMYOffice
                            : listStateCNOffice;
                        setState(() {
                          countryOffice = val as String;
                        });
                      },
                      items: listCountryOffice.map((valueCountryOffice) {
                        return DropdownMenuItem(
                          value: valueCountryOffice,
                          child: Text(valueCountryOffice),
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
                        "Select State",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      value: stateOffice,
                      onChanged: (val) {
                        setState(() {
                          stateOffice = val as String;
                        });
                      },
                      items: listStateOffice.map((valueStateOffice) {
                        return DropdownMenuItem(
                          value: valueStateOffice,
                          child: Text(valueStateOffice),
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
                        "Select City",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      value: cityOffice,
                      onChanged: (val) {
                        setState(() {
                          cityOffice = val as String;
                        });
                      },
                      items: listCityOffice.map((valueCityOffice) {
                        return DropdownMenuItem(
                          value: valueCityOffice,
                          child: Text(valueCityOffice),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(controller: postcodeOffice, name: 'Postcode'),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(controller: phoneOffice, name: 'Office Phone'),
              SizedBox(
                height: 10,
              ),
              MyTextFormField(controller: emailOffice, name: 'Office Email'),
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

  Widget _buildCompanyInfoPart() {
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
                  name: "SignUp",
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
                      Navigator.pop(context);
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
                  "Register (E)",
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
            height: 1000,
            child: _buildBasicInfoPart(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Current Job',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 1500,
            child: _buildCompanyInfoPart(),
          ),
        ],
      ),
    );
  }
}
