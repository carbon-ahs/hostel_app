import 'package:json_annotation/json_annotation.dart';

import '../ability_model/ability.dart';

@JsonSerializable()
class User {
  String? name;
  String? userName;
  String? role;
  String? roleId;
  String? email;
  String? cadetNo;
  String? institute;
  Null? classInfo;
  Null? sectionInfo;
  Null? gurdianInfo;
  String? image;
  Null? userable;
  List<Ability>? ability;

  User(
      {this.name,
      this.userName,
      this.role,
      this.roleId,
      this.email,
      this.cadetNo,
      this.institute,
      this.classInfo,
      this.sectionInfo,
      this.gurdianInfo,
      this.image,
      this.userable,
      this.ability});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['user_name'];
    role = json['role'];
    roleId = json['role_id'];
    email = json['email'];
    cadetNo = json['cadet_no'];
    institute = json['institute'];
    classInfo = json['class_info'];
    sectionInfo = json['section_info'];
    gurdianInfo = json['gurdian_info'];
    image = json['image'];
    userable = json['userable'];
    if (json['ability'] != null) {
      ability = <Ability>[];
      json['ability'].forEach((v) {
        ability!.add(new Ability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['role'] = this.role;
    data['role_id'] = this.roleId;
    data['email'] = this.email;
    data['cadet_no'] = this.cadetNo;
    data['institute'] = this.institute;
    data['class_info'] = this.classInfo;
    data['section_info'] = this.sectionInfo;
    data['gurdian_info'] = this.gurdianInfo;
    data['image'] = this.image;
    data['userable'] = this.userable;
    if (this.ability != null) {
      data['ability'] = this.ability!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
