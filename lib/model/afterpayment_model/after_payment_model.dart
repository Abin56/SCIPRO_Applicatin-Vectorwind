// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAfterPaymentModel {
 String uid;
  int coursefee;
  String coursename;
  String coursecategoryid;
  String studentname;
  String phonenumber;
  String emailid;
  String courseid;
  int duration;
  String expirydate;
  String joindate;
  bool olduser = true;
  bool deactive = false;
  UserAfterPaymentModel({
    required this.uid,
    required this.coursefee,
    required this.coursename,
    required this.coursecategoryid,
    required this.studentname,
    required this.phonenumber,
    required this.emailid,
    required this.courseid,
    required this.duration,
    required this.expirydate,
    required this.joindate,
    required this.olduser,
    required this.deactive,
  });

  UserAfterPaymentModel copyWith({
    String? uid,
    int? coursefee,
    String? coursename,
    String? coursecategoryid,
    String? studentname,
    String? phonenumber,
    String? emailid,
    String? courseid,
    int? duration,
    String? expirydate,
    String? joindate,
    bool? olduser,
    bool? deactive,
  }) {
    return UserAfterPaymentModel(
      uid: uid ?? this.uid,
      coursefee: coursefee ?? this.coursefee,
      coursename: coursename ?? this.coursename,
      coursecategoryid: coursecategoryid ?? this.coursecategoryid,
      studentname: studentname ?? this.studentname,
      phonenumber: phonenumber ?? this.phonenumber,
      emailid: emailid ?? this.emailid,
      courseid: courseid ?? this.courseid,
      duration: duration ?? this.duration,
      expirydate: expirydate ?? this.expirydate,
      joindate: joindate ?? this.joindate,
      olduser: olduser ?? this.olduser,
      deactive: deactive ?? this.deactive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'coursefee': coursefee,
      'coursename': coursename,
      'coursecategoryid': coursecategoryid,
      'studentname': studentname,
      'phonenumber': phonenumber,
      'emailid': emailid,
      'courseid': courseid,
      'duration': duration,
      'expirydate': expirydate,
      'joindate': joindate,
      'olduser': olduser,
      'deactive': deactive,
    };
  }

  factory UserAfterPaymentModel.fromMap(Map<String, dynamic> map) {
    return UserAfterPaymentModel(
      uid: map['uid'] as String,
      coursefee: map['coursefee'] as int,
      coursename: map['coursename'] as String,
      coursecategoryid: map['coursecategoryid'] as String,
      studentname: map['studentname'] as String,
      phonenumber: map['phonenumber'] as String,
      emailid: map['emailid'] as String,
      courseid: map['courseid'] as String,
      duration: map['duration'] as int,
      expirydate: map['expirydate'] as String,
      joindate: map['joindate'] as String,
      olduser: map['olduser'] as bool,
      deactive: map['deactive'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAfterPaymentModel.fromJson(String source) =>
      UserAfterPaymentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserAfterPaymentModel(uid: $uid, coursefee: $coursefee, coursename: $coursename, coursecategoryid: $coursecategoryid, studentname: $studentname, phonenumber: $phonenumber, emailid: $emailid, courseid: $courseid, duration: $duration, expirydate: $expirydate, joindate: $joindate, olduser: $olduser, deactive: $deactive)';
  }

  @override
  bool operator ==(covariant UserAfterPaymentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.coursefee == coursefee &&
      other.coursename == coursename &&
      other.coursecategoryid == coursecategoryid &&
      other.studentname == studentname &&
      other.phonenumber == phonenumber &&
      other.emailid == emailid &&
      other.courseid == courseid &&
      other.duration == duration &&
      other.expirydate == expirydate &&
      other.joindate == joindate &&
      other.olduser == olduser &&
      other.deactive == deactive;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      coursefee.hashCode ^
      coursename.hashCode ^
      coursecategoryid.hashCode ^
      studentname.hashCode ^
      phonenumber.hashCode ^
      emailid.hashCode ^
      courseid.hashCode ^
      duration.hashCode ^
      expirydate.hashCode ^
      joindate.hashCode ^
      olduser.hashCode ^
      deactive.hashCode;
  }
}
