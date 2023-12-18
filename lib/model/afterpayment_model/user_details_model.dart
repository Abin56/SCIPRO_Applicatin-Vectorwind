// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDetailsModel {
  String uid;
  String email;
  String studentname;
  String phonenumber;
  String joindate;
  UserDetailsModel({
    required this.uid,
    required this.email,
    required this.studentname,
    required this.phonenumber,
    required this.joindate,
  });

  UserDetailsModel copyWith({
    String? uid,
    String? email,
    String? studentname,
    String? phonenumber,
    String? joindate,
  }) {
    return UserDetailsModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      studentname: studentname ?? this.studentname,
      phonenumber: phonenumber ?? this.phonenumber,
      joindate: joindate ?? this.joindate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'studentname': studentname,
      'phonenumber': phonenumber,
      'joindate': joindate,
    };
  }

  factory UserDetailsModel.fromMap(Map<String, dynamic> map) {
    return UserDetailsModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      studentname: map['studentname'] as String,
      phonenumber: map['phonenumber'] as String,
      joindate: map['joindate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetailsModel.fromJson(String source) => UserDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDetailsModel(uid: $uid, email: $email, studentname: $studentname, phonenumber: $phonenumber, joindate: $joindate)';
  }

  @override
  bool operator ==(covariant UserDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.email == email &&
      other.studentname == studentname &&
      other.phonenumber == phonenumber &&
      other.joindate == joindate;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      email.hashCode ^
      studentname.hashCode ^
      phonenumber.hashCode ^
      joindate.hashCode;
  }
}
