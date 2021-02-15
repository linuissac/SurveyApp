import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:Survey/redux/AppState.dart';
import 'package:provider_for_redux/provider_for_redux.dart';
import 'package:Survey/models/Login.dart';
import 'package:Survey/components/TextField.dart';
import 'package:Survey/screens/HomeScreen/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  GlobalKey<FormState> _registerKey = new GlobalKey();
  TextEditingController emailField = TextEditingController();
  TextEditingController passField = TextEditingController();

  AnimationController _animationController;
  Animation _animation;

  String _myState = null;
  bool _obscureConfirmText = true;
  bool _obscurePassText = true;
  String email;
  String password;
  Dispatch mDispatch;

  Future<LoginResponse> _futureLoginResponse;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
    _futureLoginResponse:
    new LoginResponse();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ReduxConsumer<AppState>(
        builder: (context, store, state, dispatch, child) {
      mDispatch = dispatch;

      return Scaffold(
          backgroundColor: Colors.yellow[800],
          body: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: width,
                    height: height * 0.35,
                    decoration: BoxDecoration(color: Colors.yellow[800]),
                  ),
                  Container(
                    width: width * 0.2,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"))),
                  ),
                  Positioned(
                    child: Image.asset("assets/images/login_upper_bg.png"),
                    top: 0,
                    left: -50,
                  )
                ],
              ),
              Container(
                width: width,
                height: height * 0.65,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(100))),
                child: Column(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20,top: height*0.05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome,",
                                style: TextStyle(
                                  color: Colors.yellow[800],
                                  fontFamily: 'Proxima',
                                  fontSize: 30,
                                  fontWeight: FontWeight.normal,
                                )),
                            Text(
                              "Makehappen",
                              style: TextStyle(
                                color: Color(0xFFF7C037),
                                fontFamily: 'Proxima',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Form(
                          key: _registerKey,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 12,
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
                            ),
                          )),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      Padding(
                        padding: EdgeInsets.only(right: 12,top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height*0.075,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Text(
                        'Signin',
                        style: TextStyle(color: Colors.yellow[700]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OnBoardingButton()
                    ],
                  ),
                  
                ]),
              )
            ],
          ));
    });
  }
}

class OnBoardingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new GestureDetector(
      onTap: () => {
       // Navigator.push(
          //context,
         // MaterialPageRoute(builder: (context) => HomeScreen()),
       // ),
      },
      child: Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/icons/curve.png")))),
    );
  }
}
