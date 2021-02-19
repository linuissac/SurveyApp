import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:Survey/redux/AppState.dart';
import 'package:provider_for_redux/provider_for_redux.dart';
import 'package:Survey/models/Login.dart';
import 'package:Survey/components/TextField.dart';

class LoginScreenNew extends StatefulWidget {
  @override
  _LoginScreenNewState createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew>
    with SingleTickerProviderStateMixin {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  GlobalKey<FormState> _registerKey = new GlobalKey();
  TextEditingController emailField = TextEditingController();
  TextEditingController passField = TextEditingController();

  String _myState = null;
  bool _obscureConfirmText = true;
  bool _obscurePassText = true;
  String email;
  String password;
  Dispatch mDispatch;

  Future<LoginResponse> _futureLoginResponse;

  @override
  void initState() {
    super.initState();
    _futureLoginResponse:
    new LoginResponse();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
     Color background = Color(0xFFE5E5E5);

    return ReduxConsumer<AppState>(
        builder: (context, store, state, dispatch, child) {
      mDispatch = dispatch;

      return Scaffold(
          backgroundColor: Colors.yellow[800],
          body: Stack(children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width,
                      height: height * 0.4,
                      decoration: BoxDecoration(color: Colors.yellow[800]),
                    ),
                    Container(
                      width: width * 0.2,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"))),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100)),
                                  child: Container(
                    width: width,
                    height: height * 0.6,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height*0.04),
                        Text('Welcome',style: TextStyle(
                          fontSize: 18,
                          fontFamily: ''
                        ),),
                        Text('Makehappen')

                      ],
                    ),

                  ),
                )
              ],
            ),
            Positioned(
              child: Image.asset("assets/images/login_upper_bg.png"),
              top: 0,
              left: -50,
            ),
          ])
          
          );
    });
  }
}

class OnBoardingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: OnBoardingButtonClipper(),
      child: Container(
        width: 150,
        height: 150,
        // decoration: BoxDecoration(color: Colors.yellow[800]),
      ),
    );
  }
}

class OnBoardingButtonClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    final double innerCircleRadius = 60.0;

    path.lineTo(0, size.height/2);
    path.quadraticBezierTo(size.width*0.2, size.height/2, size.width, size.height);
    

    paint.color = Colors.green;
    canvas.drawPath(path, paint);
    //path.close();
    //  path.lineTo(size.height - 20, 0);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

/*

                SizedBox(
                  height: 50,
                ),
                Expanded(
          child: Container(
                  width: width,
                  padding:
            EdgeInsets.only(top: 55, left: 20, right: 20, bottom: 20),
                  decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
                  ),
                  child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _registerKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    AppTextFormField(
                      labelText: 'Email',
                      controller: emailField,
                      cursorColor: Colors.white,
                      onSaved: (value) => email = value,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppTextFormField(
                      labelText: 'Password',
                      controller: passField,
                      cursorColor: Colors.white,
                      obscureText: _obscurePassText,
                      onSaved: (value) => password = value,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassText
                                ? _obscurePassText = false
                                : _obscurePassText = true;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),

            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(top: 35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.black54),
                child: Center(
                  child: new Icon(
                    Icons.arrow_forward,
                    color: Colors.yellow[700],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              child: Text(
                'Forgot Password ?',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black),
              ),
            )
            // OUR WIDGETS
          ],
                  ),
                ))

*/
