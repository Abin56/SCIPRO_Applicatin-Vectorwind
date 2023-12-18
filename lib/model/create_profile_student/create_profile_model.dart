// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentProfileCreationModel {
  final String uid;
  final String studentid;
  final String name;
  final String email;
  final String imageUrl;
  final String address;
  final String phoneno;
  final String district;
  final String state;
  final String pincode;
  final String joindate;

  StudentProfileCreationModel({
    required this.uid,
    required this.studentid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.address,
    required this.phoneno,
    required this.district,
    required this.state,
    required this.pincode,
    required this.joindate,
  });

  StudentProfileCreationModel copyWith({
    String? uid,
    String? studentid,
    String? name,
    String? email,
    String? imageUrl,
    String? address,
    String? phoneno,
    String? district,
    String? state,
    String? pincode,
    String? joindate,
  }) {
    return StudentProfileCreationModel(
      uid: uid ?? this.uid,
      studentid: studentid ?? this.studentid,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
      phoneno: phoneno ?? this.phoneno,
      district: district ?? this.district,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      joindate: joindate ?? this.joindate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'studentid': studentid,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'address': address,
      'phoneno': phoneno,
      'district': district,
      'state': state,
      'pincode': pincode,
      'joindate': joindate,
    };
  }

  factory StudentProfileCreationModel.fromMap(Map<String, dynamic> map) {
    return StudentProfileCreationModel(
      uid: map['uid'] as String,
      studentid: map['studentid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] as String,
      address: map['address'] as String,
      phoneno: map['phoneno'] as String,
      district: map['district'] as String,
      state: map['state'] as String,
      pincode: map['pincode'] as String,
      joindate: map['joindate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentProfileCreationModel.fromJson(String source) =>
      StudentProfileCreationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentProfileCreationModel(uid: $uid, studentid: $studentid, name: $name, email: $email, imageUrl: $imageUrl, address: $address, phoneno: $phoneno, district: $district, state: $state, pincode: $pincode, joindate: $joindate)';
  }

  @override
  bool operator ==(covariant StudentProfileCreationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.studentid == studentid &&
      other.name == name &&
      other.email == email &&
      other.imageUrl == imageUrl &&
      other.address == address &&
      other.phoneno == phoneno &&
      other.district == district &&
      other.state == state &&
      other.pincode == pincode &&
      other.joindate == joindate;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      studentid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      imageUrl.hashCode ^
      address.hashCode ^
      phoneno.hashCode ^
      district.hashCode ^
      state.hashCode ^
      pincode.hashCode ^
      joindate.hashCode;
  }
}
