class LoginResponse {
  final String message;
  final String code;
  final int status;
  final Data data;

  // Map<String, dynamic> data;

  LoginResponse({this.message, this.code, this.status, this.data});
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'],
      code: json['code'],
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final Info info;
  final String token;
  Data({this.info, this.token});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      info: Info.fromJson(json['info']),
    );
  }
}

class Info {
  final String pp_name;
  final String pp_email;

  Info({
    this.pp_name,
    this.pp_email,
  });
  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      pp_name: json['pp_name'],
      pp_email: json['pp_email'],
      // data: json['data'],
    );
  }
}
