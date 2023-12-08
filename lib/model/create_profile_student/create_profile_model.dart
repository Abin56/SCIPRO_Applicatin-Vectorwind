// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentProfileCreationModel {
  final String uid;
  final String name;
  final String email;
  final String imageUrl;
  final String address;
  final String phoneno;
  final String district;
  final String state;
  final String pincode;

  StudentProfileCreationModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.address,
    required this.phoneno,
    required this.district,
    required this.state,
    required this.pincode,
  });

  StudentProfileCreationModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? imageUrl,
    String? address,
    String? phoneno,
    String? district,
    String? state,
    String? pincode,
  }) {
    return StudentProfileCreationModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      address: address ?? this.address,
      phoneno: phoneno ?? this.phoneno,
      district: district ?? this.district,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'address': address,
      'phoneno': phoneno,
      'district': district,
      'state': state,
      'pincode': pincode,
    };
  }

  factory StudentProfileCreationModel.fromMap(Map<String, dynamic> map) {
    return StudentProfileCreationModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] as String,
      address: map['address'] as String,
      phoneno: map['phoneno'] as String,
      district: map['district'] as String,
      state: map['state'] as String,
      pincode: map['pincode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentProfileCreationModel.fromJson(String source) =>
      StudentProfileCreationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentProfileCreationModel(uid: $uid, name: $name, email: $email, imageUrl: $imageUrl, address: $address, phoneno: $phoneno, district: $district, state: $state, pincode: $pincode)';
  }

  @override
  bool operator ==(covariant StudentProfileCreationModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.imageUrl == imageUrl &&
        other.address == address &&
        other.phoneno == phoneno &&
        other.district == district &&
        other.state == state &&
        other.pincode == pincode;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        imageUrl.hashCode ^
        address.hashCode ^
        phoneno.hashCode ^
        district.hashCode ^
        state.hashCode ^
        pincode.hashCode;
  }
}
