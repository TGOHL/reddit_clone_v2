// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'comment.dart';

class Post {
  final String id;
  final String autherId;
  final String attachmentUrl;
  final String content;
  final String reddit;
  final DateTime date;
  int likesCount;
  final List<CommentModel> comments;

  int get commentsCount {
    int count = 0;
    for (var element in comments) {
      count++;
      count += element.replysCount;
    }
    return count;
  }

  Post({
    required this.id,
    required this.autherId,
    required this.attachmentUrl,
    required this.content,
    required this.reddit,
    required this.date,
    required this.likesCount,
    required this.comments,
  });

  Post copyWith({
    String? id,
    String? autherId,
    String? attachmentUrl,
    String? content,
    String? reddit,
    DateTime? date,
    int? likesCount,
    List<CommentModel>? comments,
  }) {
    return Post(
      id: id ?? this.id,
      autherId: autherId ?? this.autherId,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
      content: content ?? this.content,
      reddit: reddit ?? this.reddit,
      date: date ?? this.date,
      likesCount: likesCount ?? this.likesCount,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'autherId': autherId,
      'attachmentUrl': attachmentUrl,
      'content': content,
      'reddit': reddit,
      'date': date.millisecondsSinceEpoch,
      'likesCount': likesCount,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      autherId: map['autherId'] as String,
      attachmentUrl: map['attachmentUrl'] as String,
      content: map['content'] as String,
      reddit: map['reddit'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      likesCount: map['likesCount'] as int,
      comments: List<CommentModel>.from(
        (map['comments'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, autherId: $autherId, attachmentUrl: $attachmentUrl, content: $content, reddit: $reddit, date: $date, likesCount: $likesCount, comments: $comments)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.autherId == autherId &&
        other.attachmentUrl == attachmentUrl &&
        other.content == content &&
        other.reddit == reddit &&
        other.date == date &&
        other.likesCount == likesCount &&
        listEquals(other.comments, comments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        autherId.hashCode ^
        attachmentUrl.hashCode ^
        content.hashCode ^
        reddit.hashCode ^
        date.hashCode ^
        likesCount.hashCode ^
        comments.hashCode;
  }
}
