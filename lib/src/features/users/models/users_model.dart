// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UsersModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? createdAt;
  String? modifiedAt;

  UsersModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.modifiedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'created_at': createdAt,
      'modified_at': modifiedAt,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      modifiedAt:
          map['modified_at'] != null ? map['modified_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsersModel.fromJson(String source) =>
      UsersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
