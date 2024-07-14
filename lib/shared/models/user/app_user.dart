import 'dart:convert';

class AppUser {
  final String id;
  final String name;
  final String? subname;
  final String imageUrl;

  AppUser({
    required this.id,
    required this.name,
    this.subname,
    required this.imageUrl,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? subname,
    String? imageUrl,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      subname: subname ?? this.subname,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'subname': subname,
      'imageUrl': imageUrl,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['name'] as String,
      subname: map['subname'] != null ? map['subname'] as String : null,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, subname: $subname, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.subname == subname && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ subname.hashCode ^ imageUrl.hashCode;
  }
}
