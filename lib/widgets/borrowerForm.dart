import 'package:flutter/material.dart';

import 'myTextFormField.dart';

class SkillsForm extends StatefulWidget {
  @override
  State<SkillsForm> createState() => _SkillsFormState();
}

class _SkillsFormState extends State<SkillsForm> {
  final form = GlobalKey<FormState>();
  final TextEditingController skills = TextEditingController();
  String? valueChoose;
  List listItem = ['Basic', 'Intermediate', 'Advance'];

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title:
          // IconButton(
          //   icon: Icon(Icons.delete),
          //   onPressed: () {},
          // ),
          Text(''),
      initiallyExpanded: true,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Card(
            child: Form(
              key: form,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 260,
                                child: MyTextFormField(
                                    controller: skills, name: 'Enter Skills')),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 260,
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
                                  "Level",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 17,
                                  ),
                                ),
                                underline: SizedBox(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                value: valueChoose,
                                onChanged: (val) {
                                  setState(() {
                                    valueChoose = val as String;
                                  });
                                },
                                items: listItem.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
