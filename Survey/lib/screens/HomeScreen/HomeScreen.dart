import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:SurveyApp/screens/TrenchingGang/TrenchingGang.dart';
import 'package:SurveyApp/screens/AdvancedCivilTeam/AdvancedCivil.dart';
import 'package:SurveyApp/screens/ActivationCableTeam/ActivationCable.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  int segmentedControlGroupValue = 0;

  final Map<int, Widget> myTabs = <int, Widget>{
    0: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text("Timesheet"),
    ),
    1: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text("Defect Logs"),
    ),
  };
  DateTime selectedDate = DateTime.now();
  bool timeSheet = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            "assets/images/header_logo.png",
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: new Container(
            // height: 250,
            padding: const EdgeInsets.all(40.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "JOHN SMITH - MHG-SR-001",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Proxima',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new IconButton(
                      icon: new Icon(Icons.calendar_today_outlined),
                      onPressed: () => _selectDate(context),
                      color: Colors.yellow[600],
                    ),
                    Text("${selectedDate.toLocal()}".split(' ')[0]),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoSlidingSegmentedControl(
                  groupValue: segmentedControlGroupValue,
                  children: myTabs,
                  onValueChanged: (i) {
                    setState(() {
                      segmentedControlGroupValue = i;
                    });
                  },
                  backgroundColor: Colors.grey[50],
                  thumbColor: Colors.yellow[700],

                  // padding: EdgeInsets.all(10),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(children: [
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(children: [
                      Image(
                          image: AssetImage("assets/images/trenching.png"),
                          fit: BoxFit.fill,
                          height: 180),
                      Positioned(
                        left: 10,
                        bottom: 15,
                        width: 150,
                        child: Container(
                          width: 80,
                          height: 40,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Trenching Gang"),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TrenchingScreen()),
                                    );
                                  },
                                  child: new Icon(
                                    Icons.arrow_forward,
                                    color: Colors.yellow[700],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Image(
                            image: AssetImage("assets/images/civil.png"),
                            fit: BoxFit.fill,
                            height: 180),
                        Positioned(
                          left: 10,
                          bottom: 15,
                          width: 180,
                          child: Container(
                            width: 80,
                            height: 40,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Advaced Civil Team"),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CivilTeam()),
                                      );
                                    },
                                    child: new Icon(
                                      Icons.arrow_forward,
                                      color: Colors.yellow[700],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                        Image(
                            image: AssetImage("assets/images/cable.png"),
                            fit: BoxFit.fill,
                            height: 180),
                        Positioned(
                          left: 10,
                          bottom: 15,
                          width: 200,
                          child: Container(
                            width: 80,
                            height: 40,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Activation/Cable Team"),
                                  GestureDetector(
                                    onTap: () {
                                      // print("Container was tapped");Cable
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Cable()),
                                      );
                                    },
                                    child: new Icon(
                                      Icons.arrow_forward,
                                      color: Colors.yellow[700],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ],
            )),
      ),
    );
  }
}
