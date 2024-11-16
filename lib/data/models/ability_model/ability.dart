
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Ability {
  String? action;
  String? subject;

  Ability({this.action, this.subject});

  Ability.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['subject'] = this.subject;
    return data;
  }
}