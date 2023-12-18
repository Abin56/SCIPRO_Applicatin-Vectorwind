// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDeatails {
  String uid;
  String studentname;
  String joindate;
  String email;
  String phonenumber;
  UserDeatails({
    required this.uid,
    required this.studentname,
    required this.joindate,
    required this.email,
    required this.phonenumber,
  });
  

  UserDeatails copyWith({
    String? uid,
    String? studentname,
    String? joindate,
    String? email,
    String? phonenumber,
  }) {
    return UserDeatails(
      uid: uid ?? this.uid,
      studentname: studentname ?? this.studentname,
      joindate: joindate ?? this.joindate,
      email: email ?? this.email,
      phonenumber: phonenumber ?? this.phonenumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'studentname': studentname,
      'joindate': joindate,
      'email': email,
      'phonenumber': phonenumber,
    };
  }

  factory UserDeatails.fromMap(Map<String, dynamic> map) {
    return UserDeatails(
      uid: map['uid'] as String,
      studentname: map['studentname'] as String,
      joindate: map['joindate'] as String,
      email: map['email'] as String,
      phonenumber: map['phonenumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDeatails.fromJson(String source) => UserDeatails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserDeatails(uid: $uid, studentname: $studentname, joindate: $joindate, email: $email, phonenumber: $phonenumber)';
  }

  @override
  bool operator ==(covariant UserDeatails other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.studentname == studentname &&
      other.joindate == joindate &&
      other.email == email &&
      other.phonenumber == phonenumber;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      studentname.hashCode ^
      joindate.hashCode ^
      email.hashCode ^
      phonenumber.hashCode;
  }
}
