// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../config/keys.dart';

class AppUser {
  final String id;
  final String name;

  AppUser({
    required this.id,
    required this.name,
  });

  AppUser copyWith({
    String? id,
    String? name,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DBKeys.uid: id,
      DBKeys.username: name,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map[DBKeys.uid] as String,
      name: map[DBKeys.username] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AppUser(id: $id, name: $name)';

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
