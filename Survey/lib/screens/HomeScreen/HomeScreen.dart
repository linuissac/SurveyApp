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
import 'package:image_size_getter/image_size_getter.dart';
import 'package:image_size_getter/file_input.dart';

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

  final List<UploadImages> uploadImgesArr = List<UploadImages>();

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
    final image = await picker.getImage(source: ImageSource.camera);
    String fileName = image.path.split('/').last;
    setState(() {
      this.uploadImgesArr.add(UploadImages(
          title: fileName,
          size: '1.2 Mb',
          imageFile: image.toString(),
          imageUrl: File(image.path)));
    });
    print(fileName);

    String type = fileName.split('.').last;
    print(type);
  }

  _imgFromGallery() async {
    print('here');
    final image = await picker.getImage(
      source: ImageSource.gallery,
    );
    String fileName = image.path.split('/').last;
                        ),
          ),
          SizedBox(
              color: Color(0xFFF9F9F9),
                  decoration: InputDecoration.collapsed(
                  ),
            color: Colors.grey[400],
                width: width,
                color: Color(0xFFF9F9F9),
                child: GestureDetector(
                  onTap: () {
                    this.uploadImgesArr.length >= 4
                        ? _showAlert(context)
                        : _showPicker(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      new IconButton(
                        onPressed: () {
                          this.uploadImgesArr.length >= 4
                              ? _showAlert(context)
                              : _showPicker(context);
                        },
                        icon: new Icon(Icons.cloud_done_outlined),
                      ),
                      Text('Upload your photo here')
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 25,
          ),
          _buildMoviesList(),
          SizedBox(
            height: 35,
          ),
          Center(
            child: RaisedButton(
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => {},
              color: Colors.yellow[700],
              textColor: Colors.white,
              padding:
                  EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
              splashColor: Colors.grey,
            ),
          )
        ]));
  }

  //Time sheet card
  Widget _timeSheetCard(BuildContext context, String name, String image) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(children: [
        Image(image: AssetImage(image), fit: BoxFit.fill, height: 180),
        Positioned(
          left: 10,
          bottom: 15,
          width: 200,
          child: Container(
            height: 40,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(name),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrenchingScreen()),
                      );
                    },
                    child: new Icon(
                      Icons.arrow_forward,
                      color: Colors.yellow[700],
                    ),
                  ),
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
    );
  }

  Widget _buildMoviesList() {
    return Container(
        child: ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: this.uploadImgesArr.length,
      itemBuilder: (BuildContext context, int index) {
        return UploadImageCard(
          movie: this.uploadImgesArr[index],
          index: index,
          onCountChange: (int val) {
            setState(() {
              this.uploadImgesArr.removeAt(val);
            });
          },
        );
      },
    ));
  }
}

//Image Class

class UploadImages {
  final String title;
  final String size;
  final File imageUrl;
  final String imageFile;
  UploadImages({this.title, this.size, this.imageUrl, this.imageFile});
}

class UploadImageCard extends StatelessWidget {
  final UploadImages movie;

  UploadImageCard({this.movie, this.onCountChange, this.index});

  final Function(int) onCountChange;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              movie.imageUrl,
              fit: BoxFit.fill,
              width: 60,
              height: 60,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title),
                      SizedBox(
                        height: 10,
                      ),
                      Text(movie.size)
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.yellow[100],
                  radius: 15,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.close,
                      size: 14,
                    ),
                    color: Colors.yellow[700],
                    onPressed: () {
                      onCountChange(index);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // child: ListTile(
      //   contentPadding: EdgeInsets.zero,
      //   leading: Container (
      //     color: Colors.red,
      //     width: 150,
      //     height: 150,
      //     child: Image.file(movie.imageUrl,fit: BoxFit.fill,),
      //   ),
      //   title: Text(movie.title),
      //   subtitle: Text(movie.size),
      // ),
    );
  }
}
