import 'package:Survey/models/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:Survey/models/login.dart';

@immutable
class LoginState {
  final LoadingStatus loadingStatus;
  final Data data;
  final String token;
  LoginState({this.loadingStatus, this.token, this.data});

  factory LoginState.initial() {
    return LoginState(
      loadingStatus: LoadingStatus.success,
      token: '',
      data: null,
    );
  }

  LoginState copyWith({LoadingStatus loadingStatus, Data data, String token}) {
    // print(token);
    // print(data);
    return LoginState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        data: data ?? this.data,
        token: token ?? this.token);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          loadingStatus == other.loadingStatus &&
          data == other.data &&
          token == other.token;

  @override
  int get hashCode => loadingStatus.hashCode ^ data.hashCode ^ token.hashCode;
}
