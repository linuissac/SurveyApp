import 'package:Survey/redux/LoginState.dart';
import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final LoginState loginState;

  AppState({
    @required this.loginState,
  });

  static AppState initial() => AppState(
        loginState: LoginState.initial(),
      );
  AppState copyWith({
    LoginState loginState,
  }) =>
      AppState(
        loginState: loginState ?? this.loginState,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          loginState == other.loginState;

  @override
  int get hashCode => loginState.hashCode;
}
