import 'package:flutter/material.dart';
import 'package:supercash_mobile_app/screens/borrower.dart';
import 'package:supercash_mobile_app/widgets/myTextFormField.dart';

class AddBrrower extends StatefulWidget {
  const AddBrrower({Key? key}) : super(key: key);

  @override
  State<AddBrrower> createState() => _AddBrrowerState();
}

final TextEditingController email = TextEditingController();
final TextEditingController NRIC = TextEditingController();
final TextEditingController firstName = TextEditingController();
final TextEditingController lastName = TextEditingController();
final TextEditingController mobile = TextEditingController();
final TextEditingController uniqueNumber = TextEditingController();
final TextEditingController address = TextEditingController();
final TextEditingController zipCode = TextEditingController();

class _AddBrrowerState extends State<AddBrrower> {
  String gender = 'Male';
  DateTime date = DateTime(2022, 07, 05);
  String? country;
  final List listCountry = ['Malaysia'];
  String? state;
  final List listState = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Borrower()));
            }),
        title: Text("Add Borrower"),
        backgroundColor: Color.fromARGB(255, 52, 58, 64),
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Required Fields',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                        name: "Email",
                        controller: email,
                      ),
                      SizedBox(
                        height: 10,
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[700]),
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
                                "Country",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              underline: SizedBox(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              value: country,
                              onChanged: (val) {
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Optinal Fields',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                        name: "Mobile Eg.0123335858",
                        controller: mobile,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                        name: "Unique Number Eg.256658",
                        controller: uniqueNumber,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(
                        name: "Address",
                        controller: address,
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
                                "State",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                              underline: SizedBox(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
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
                      MyTextFormField(
                        name: "Zip Code Eg.53200",
                        controller: zipCode,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
