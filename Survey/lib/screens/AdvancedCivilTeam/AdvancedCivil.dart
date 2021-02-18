import 'package:async_redux/async_redux.dart';
import 'package:SurveyApp/redux/AppState.dart';
import 'package:provider_for_redux/provider_for_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SurveyApp/components/CustomTextField.dart';
import 'package:signature/signature.dart';

class CivilTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CivilTeamState();
  }
}

class CivilTeamState extends State<CivilTeam> {
  @override
  DateTime selectedDate = DateTime.now();

  GlobalKey<FormState> _trenchingKey = new GlobalKey();
  Dispatch mDispatch;
  String streetName;
  String password;
  var currentSelectedValue;
  final deviceTypes = ["Tarmac1", "Tarmac2", "Tarmac3"];

  var trenchSelectedValue;
  final trenchTypes = ["Ducted1", "Ducted2", "Ducted3"];

  TimeOfDay startTime;
  TimeOfDay endTime;

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

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );

  _pickStartTime() async {
    TimeOfDay t =
        await showTimePicker(context: context, initialTime: startTime);
    if (t != null)
      setState(() {
        startTime = t;
      });
  }

  _pickEndTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: endTime);
    if (t != null)
      setState(() {
        endTime = t;
      });
  }

  @override
  void initState() {
    startTime = TimeOfDay.now();
    endTime = TimeOfDay.now();
    super.initState();
  }

  Widget build(BuildContext context) {
    return ReduxConsumer<AppState>(
        builder: (context, store, state, dispatch, child) {
      mDispatch = dispatch;

      return new Scaffold(
        appBar: AppBar(
          title: Text('Advanced civils Team',
              style: TextStyle(
                color: Colors.black,
              )),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: new Container(
              // height: 250,
              padding: const EdgeInsets.all(20.0),
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
                  Form(
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
                            Text("Street Name"),
                            SizedBox(
                              height: 14,
                            ),
                            CustomTextField(
                              cursorColor: Colors.white,
                              onSaved: (value) => streetName = value,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text("BOQ Identification"),
                            SizedBox(
                              height: 14,
                            ),
                            CustomTextField(
                              cursorColor: Colors.white,
                              onSaved: (value) => streetName = value,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text("Work Activity"),
                            SizedBox(
                              height: 14,
                            ),
                            InputDecorator(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF9F9F9),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.7),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF9F9F9),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.7),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  // hint: Text("Select Device"),
                                  value: currentSelectedValue,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconEnabledColor: Colors.yellow[600],
                                  isDense: true,
                                  onChanged: (newValue) {
                                    setState(() {
                                      currentSelectedValue = newValue;
                                    });
                                    print(currentSelectedValue);
                                  },
                                  items: deviceTypes.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Length"),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    CustomTextField(
                                      cursorColor: Colors.white,
                                      onSaved: (value) => streetName = value,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Width"),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    CustomTextField(
                                      cursorColor: Colors.white,
                                      onSaved: (value) => streetName = value,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            Row(children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Depth"),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    CustomTextField(
                                      cursorColor: Colors.white,
                                      onSaved: (value) => streetName = value,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Value"),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    CustomTextField(
                                      cursorColor: Colors.white,
                                      onSaved: (value) => streetName = value,
                                    ),
                                  ],
                                ),
                              )
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            Row(children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Start"),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    GestureDetector(
                                      onTap: () => _pickStartTime(),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF9F9F9),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  color: Colors.yellow[700],
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    "${startTime.hour}:${startTime.minute}"),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("End"),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    GestureDetector(
                                      onTap: () => _pickEndTime(),
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF9F9F9),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  color: Colors.yellow[700],
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    "${endTime.hour}:${endTime.minute}"),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            Text("Engineer Signature"),
                            SizedBox(
                              height: 14,
                            ),
                            //SIGNATURE CANVAS
                            Signature(
                              controller: _controller,
                              height: 120,
                              backgroundColor: Color(0xFFF9F9F9),
                            ),
                            //OK AND CLEAR BUTTONS
                            Container(
                              decoration:
                                  const BoxDecoration(color: Color(0xFFF9F9F9)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  //SHOW EXPORTED IMAGE IN NEW ROUTE
                                  IconButton(
                                    icon: const Icon(Icons.check),
                                    color: Colors.yellow[600],
                                    onPressed: () async {
                                      if (_controller.isNotEmpty) {
                                        var data =
                                            await _controller.toPngBytes();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return Scaffold(
                                                appBar: AppBar(),
                                                body: Center(
                                                    child: Container(
                                                        color: Colors.grey[300],
                                                        child: Image.memory(
                                                            data))),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  //CLEAR CANVAS
                                  IconButton(
                                    icon: const Icon(Icons.clear),
                                    color: Colors.yellow[600],
                                    onPressed: () {
                                      setState(() => _controller.clear());
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
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
                                      left: 50, right: 50, top: 10, bottom: 10),
                                  splashColor: Colors.grey,
                                ),
                              ],
                            )
                          ]))
                ],
              )),
        ),
      );
    });
  }
}
