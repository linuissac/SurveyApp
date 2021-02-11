import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:Survey/redux/AppState.dart';
import 'package:provider_for_redux/provider_for_redux.dart';
import 'package:Survey/models/Login.dart';
import 'package:Survey/components/TextField.dart';

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
        appBar: AppBar(
          title: Text('Home',
              style: TextStyle(
                color: Colors.black,
              )),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.yellow[600],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.075,
            ),
            Container(
                child: Column(
              children: [
                Container(
                  width: 100,
                  child: Container(
                    child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Image(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.fitWidth, // use this
                        )),
                  ),
                ),
              ],
            )),
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
              child: SingleChildScrollView(
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
              ),
            ))
          ],
        ),
      );
    });
  }
}
