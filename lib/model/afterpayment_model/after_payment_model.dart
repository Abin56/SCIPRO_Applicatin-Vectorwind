// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAfterPaymentModel {
  String uid;
  int coursefee;
  String coursename;
  String coursecategoryid;
  
  String courseid;
  int duration;
  String expirydate;
  String joindate;
  bool olduser = true;
  UserAfterPaymentModel({
    required this.uid,
    required this.coursefee,
    required this.coursename,
    required this.coursecategoryid,
    required this.courseid,
    required this.duration,
    required this.expirydate,
    required this.joindate,
    required this.olduser,
  });

  UserAfterPaymentModel copyWith({
    String? uid,
    int? coursefee,
    String? coursename,
    String? coursecategoryid,
    String? courseid,
    int? duration,
    String? expirydate,
    String? joindate,
    bool? olduser,
  }) {
    return UserAfterPaymentModel(
      uid: uid ?? this.uid,
      coursefee: coursefee ?? this.coursefee,
      coursename: coursename ?? this.coursename,
      coursecategoryid: coursecategoryid ?? this.coursecategoryid,
      courseid: courseid ?? this.courseid,
      duration: duration ?? this.duration,
      expirydate: expirydate ?? this.expirydate,
      joindate: joindate ?? this.joindate,
      olduser: olduser ?? this.olduser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'coursefee': coursefee,
      'coursename': coursename,
      'coursecategoryid': coursecategoryid,
      'courseid': courseid,
      'duration': duration,
      'expirydate': expirydate,
      'joindate': joindate,
      'olduser': olduser,
    };
  }

  factory UserAfterPaymentModel.fromMap(Map<String, dynamic> map) {
    return UserAfterPaymentModel(
      uid: map['uid'] as String,
      coursefee: map['coursefee'] as int,
      coursename: map['coursename'] as String,
      coursecategoryid: map['coursecategoryid'] as String,
      courseid: map['courseid'] as String,
      duration: map['duration'] as int,
      expirydate: map['expirydate'] as String,
      joindate: map['joindate'] as String,
      olduser: map['olduser'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAfterPaymentModel.fromJson(String source) =>
      UserAfterPaymentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserAfterPaymentModel(uid: $uid, coursefee: $coursefee, coursename: $coursename, coursecategoryid: $coursecategoryid, courseid: $courseid, duration: $duration, expirydate: $expirydate, joindate: $joindate, olduser: $olduser)';
  }

  @override
  bool operator ==(covariant UserAfterPaymentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.coursefee == coursefee &&
      other.coursename == coursename &&
      other.coursecategoryid == coursecategoryid &&
      other.courseid == courseid &&
      other.duration == duration &&
      other.expirydate == expirydate &&
      other.joindate == joindate &&
      other.olduser == olduser;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      coursefee.hashCode ^
      coursename.hashCode ^
      coursecategoryid.hashCode ^
      courseid.hashCode ^
      duration.hashCode ^
      expirydate.hashCode ^
      joindate.hashCode ^
      olduser.hashCode;
  }
}