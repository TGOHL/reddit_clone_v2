// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CommentModel {
  final String id;
  final String autherId;
  final String content;
  int likesCount;
  final DateTime date;
  final List<CommentModel> replys;
  bool isLoaded;

  int get replysCount {
    int count = 0;
    for (var element in replys) {
      count++;
      count += element.replysCount;
    }
    return count;
  }

  bool get hasMention => content.contains('r/');
  bool get hasReplys => replysCount > 0;

  List<String> get splittedContent {
    content.split('r/');
    return [];
  }

  CommentModel({
    required this.id,
    required this.autherId,
    required this.content,
    required this.likesCount,
    required this.date,
    required this.replys,
    this.isLoaded = true,
  });

  CommentModel copyWith({
    String? id,
    String? autherId,
    String? content,
    int? likesCount,
    DateTime? date,
    List<CommentModel>? replys,
    bool? isLoaded,
  }) {
    return CommentModel(
      id: id ?? this.id,
      autherId: autherId ?? this.autherId,
      content: content ?? this.content,
      likesCount: likesCount ?? this.likesCount,
      date: date ?? this.date,
      replys: replys ?? this.replys,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'autherId': autherId,
      'content': content,
      'likesCount': likesCount,
      'date': date.millisecondsSinceEpoch,
      'replys': replys.map((x) => x.toMap()).toList(),
      'isLoaded': isLoaded,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as String,
      autherId: map['autherId'] as String,
      content: map['content'] as String,
      likesCount: map['likesCount'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      replys: List<CommentModel>.from(
        (map['replys'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isLoaded: map['isLoaded'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) => CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(id: $id, autherId: $autherId, content: $content, likesCount: $likesCount, date: $date, replys: $replys, isLoaded: $isLoaded)';
  }

  @override
  bool operator ==(covariant CommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.autherId == autherId &&
        other.content == content &&
        other.likesCount == likesCount &&
        other.date == date &&
        listEquals(other.replys, replys) &&
        other.isLoaded == isLoaded;
  }

  @override
  int get hashCode {
    return id.hashCode ^ autherId.hashCode ^ content.hashCode ^ likesCount.hashCode ^ date.hashCode ^ replys.hashCode ^ isLoaded.hashCode;
  }
}
