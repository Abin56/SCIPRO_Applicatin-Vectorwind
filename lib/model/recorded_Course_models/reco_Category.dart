// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: file_names

class RecordedCoursesModel {
  String id;
  String name;
  int position;
  RecordedCoursesModel({
    required this.id,
    required this.name,
    required this.position,
  });

  RecordedCoursesModel copyWith({
    String? id,
    String? name,
    int? position,
  }) {
    return RecordedCoursesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'position': position,
    };
  }

  factory RecordedCoursesModel.fromMap(Map<String, dynamic> map) {
    return RecordedCoursesModel(
      id: map['id'] as String,
      name: map['name'] as String,
      position: map['position'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecordedCoursesModel.fromJson(String source) => RecordedCoursesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RecordedCoursesModel(id: $id, name: $name, position: $position)';

  @override
  bool operator ==(covariant RecordedCoursesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.position == position;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ position.hashCode;
}
