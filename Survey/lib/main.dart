import 'package:flutter/material.dart';
import './screens/LoginScreen/LoginNew.dart';
import './redux/AppState.dart';
import 'package:async_redux/async_redux.dart';
import 'package:provider_for_redux/provider_for_redux.dart';
import 'package:Survey/Router.dart' as router;


Store<AppState> store;
final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  store = Store<AppState>(initialState: AppState.initial());
  NavigateAction.setNavigatorKey(navigatorKey);
  runApp(MyApp());
}

final routes = {
 // '/': (BuildContext context) => SplashScreen(),
  "/loginRoute": (BuildContext context) => LoginScreenNew(),
  //"/signUpRoute": (BuildContext context) => SignUpScreen(),
 // "/launch": (BuildContext context) => LaunchingScreen(),
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AsyncReduxProvider<AppState>.value(
      value: store,
      child: MaterialApp(
        initialRoute: '/loginRoute',
        navigatorKey: navigatorKey,
        // theme: ThemeData(
        //     primaryColor: ColorResource.colorPrimary,
        //     primaryColorDark: ColorResource.colorPrimaryDark),
        onGenerateRoute: router.generateRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Container())),
        ),
      ));
}