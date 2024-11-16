import '../user_model/user.dart';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AuthData {
  String? status;
  User? user;
  String? accessToken;
  String? refreshToken;

  AuthData({this.status, this.user, this.accessToken, this.refreshToken});

  AuthData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}