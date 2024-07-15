// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdModel {
  final String title;
  final String content;
  final String siteUrl;
  final String logoUrl;
  final String imageUrl;
  AdModel({
    required this.title,
    required this.content,
    required this.siteUrl,
    required this.logoUrl,
    required this.imageUrl,
  });

  AdModel copyWith({
    String? title,
    String? content,
    String? siteUrl,
    String? logoUrl,
    String? imageUrl,
  }) {
    return AdModel(
      title: title ?? this.title,
      content: content ?? this.content,
      siteUrl: siteUrl ?? this.siteUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'siteUrl': siteUrl,
      'logoUrl': logoUrl,
      'imageUrl': imageUrl,
    };
  }

  factory AdModel.fromMap(Map<String, dynamic> map) {
    return AdModel(
      title: map['title'] as String,
      content: map['content'] as String,
      siteUrl: map['siteUrl'] as String,
      logoUrl: map['logoUrl'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdModel.fromJson(String source) => AdModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdModel(title: $title, content: $content, siteUrl: $siteUrl, logoUrl: $logoUrl, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant AdModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.content == content && other.siteUrl == siteUrl && other.logoUrl == logoUrl && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^ content.hashCode ^ siteUrl.hashCode ^ logoUrl.hashCode ^ imageUrl.hashCode;
  }
}
