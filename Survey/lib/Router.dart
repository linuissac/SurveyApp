import 'package:flutter/material.dart';
import './screens/LoginScreen/LoginScreen.dart';
import './screens/LoginScreen/LoginNew.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case '/':
    //   return MaterialPageRoute(builder: (context) => SplashScreen());
    case '/loginRoute':
      return MaterialPageRoute(builder: (context) => LoginScreen());
    // case '/signUpRoute':
    //   return MaterialPageRoute(builder: (context) => SignUpScreen());
    // case '/launch':
    //   return MaterialPageRoute(builder: (context) => LaunchingScreen());
    // case '/matchDetails':
    //   return MaterialPageRoute(builder: (context) => ScoreCardScreen(settings.arguments));
    // case '/playerDetails':
    //   return MaterialPageRoute(builder: (context) => PlayerDetailsScreen(settings.arguments));
    // case '/videoDetails':
    //   return MaterialPageRoute(builder: (context) => VideoScreen());
    // case '/newsDetails':
    //   var details = Map<String, String>.from(settings.arguments);
    //   return MaterialPageRoute(builder: (context) => WebViewWithAppBarScreen(arguments: details));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(body: Center(child: Container())));
  }
}