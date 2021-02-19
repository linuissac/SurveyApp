import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:Survey/screens/TrenchingGang/TrenchingGang.dart';
import 'package:Survey/screens/AdvancedCivilTeam/AdvancedCivil.dart';
import 'package:Survey/screens/ActivationCableTeam/ActivationCable.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  int segmentedControlGroupValue = 0;
  GlobalKey<FormState> _trenchingKey = new GlobalKey();
  File _image;
  final picker = ImagePicker();

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

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }

  _imgFromGallery() async {
    print('here');
    File image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );

    String fileName = image.path.split('/').last;
    setState(() {
      image:
      fileName;
    });
    print(fileName);

    String type = fileName.split('.').last;
    print(type);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            // width: width * 0.85,
            // height: 250,
            padding: const EdgeInsets.all(15.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      timeSheet = !timeSheet;
                    });
                  },
                  backgroundColor: Colors.grey[50],
                  thumbColor: Colors.yellow[700],

                  // padding: EdgeInsets.all(10),
                ),
                SizedBox(
                  height: 20,
                ),
                timeSheet
                    ? Column(children: [
                        Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(children: [
                            Image(
                                image:
                                    AssetImage("assets/images/trenching.png"),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
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
                                                  builder: (context) =>
                                                      CivilTeam()),
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
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
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
                                                  builder: (context) =>
                                                      Cable()),
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
                      ])
                    : (Form(
                        key: _trenchingKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Contract name / Number"),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () => {},
                                          child: Container(
                                            width: 60,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.yellow[600],
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text("Description"),
                              SizedBox(
                                height: 14,
                              ),
                              Card(
                                  color: Color(0xFFF9F9F9),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      maxLines: 6,
                                      decoration: InputDecoration.collapsed(
                                        filled: true,
                                        fillColor: Color(0xFFF9F9F9),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  DottedBorder(
                                    dashPattern: [8, 4],
                                    strokeWidth: 0.5,
                                    child: GestureDetector(
                                      onTap: () {
                                        _showPicker(context);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 120,
                                          width: width,
                                          color: Colors.white,
                                          child: new IconButton(
                                            icon: new Icon(
                                                Icons.cloud_done_outlined),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RaisedButton(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    onPressed: () => {},
                                    color: Colors.yellow[700],
                                    textColor: Colors.white,
                                    padding: EdgeInsets.only(
                                        left: 50,
                                        right: 50,
                                        top: 10,
                                        bottom: 10),
                                    splashColor: Colors.grey,
                                  ),
                                ],
                              )
                            ]))),
              ],
            )),
      ),
    );
  }
}
