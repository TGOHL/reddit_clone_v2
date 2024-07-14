import 'package:flutter/material.dart';
import 'package:reddit_clone/shared/config/assets.dart';
import 'package:reddit_clone/shared/enums/comment_sort.dart';
import 'package:reddit_clone/shared/models/app/comment.dart';
import 'package:reddit_clone/shared/models/app/post.dart';
import 'package:reddit_clone/shared/models/user/app_user.dart';

class DatabaseService with ChangeNotifier {
  CommentSortType sortType = CommentSortType.NEW;
  final List<AppUser> _users = [
    AppUser(id: 'user_a', name: "Ibrahim Adel", imageUrl: AppAssets.ASSET_PROFILE_1_IMAGE, subname: "ABD | SSS | UNE"),
  ];
  Comment comment = Comment(
    id: 'abc',
    ownerId: 'user_a',
    content: "This is some Data to be loaded in the comment section, This is some Data to be loaded in the comment section",
    likesCount: 3,
    date: DateTime.now().subtract(const Duration(minutes: 5)),
    replys: [],
  );

  Post _post = Post(
    id: "_post 1",
    ownerId: "user_a",
    content: "After a year of collecting _posts for this build, I present my finished Heavy-9 (Thocky typing test at the end!)",
    attachmentUrl: AppAssets.ASSET_VIDEO_FILE,
    date: DateTime.now().subtract(const Duration(hours: 5)),
    likesCount: 6,
    comments: [
      Comment(
        id: 'abc5',
        ownerId: 'user_a',
        content: "This is some Data to be loaded in the comment section, This is some Data to be loaded in the comment section",
        likesCount: 3,
        date: DateTime.now().subtract(const Duration(minutes: 5)),
        replys: [
          Comment(
            id: 'abc4',
            ownerId: 'user_a',
            content: "This is some Data to be loaded in the comment section, This is some Data to be loaded in the comment section",
            likesCount: 2,
            date: DateTime.now().subtract(const Duration(minutes: 22)),
            replys: [
              Comment(
                id: 'abc3',
                ownerId: 'user_a',
                content: "This is some Data to be loaded in the comment section, This is some Data to be loaded in the comment section",
                likesCount: 5,
                date: DateTime.now().subtract(const Duration(minutes: 15)),
                replys: [],
              ),
              Comment(
                id: 'abc2',
                ownerId: 'user_a',
                content: "This is some Data to be loaded in the comment section, This is some Data to be loaded in the comment section",
                likesCount: 32,
                date: DateTime.now().subtract(const Duration(minutes: 53)),
                replys: [],
              ),
            ],
          ),
          Comment(
            id: 'abc1',
            ownerId: 'user_a',
            content: "This is some Data to be loaded in the comment section, This is some Data to be loaded in the comment section",
            likesCount: 31,
            date: DateTime.now().subtract(const Duration(minutes: 1)),
            replys: [],
          ),
        ],
      ),
      Comment(
        id: 'abc11',
        ownerId: 'user_a',
        content: "This is some Data to be loaded in the comment section, This is some Data to be loaded in the comment section",
        likesCount: 322,
        date: DateTime.now().subtract(const Duration(minutes: 15)),
        replys: [],
      ),
    ],
  );

  List<AppUser> get users => [..._users];
  List<Comment> get comments => [..._post.comments];

  Post getPost() => _post;

  void addNewAppUser(AppUser u) => _users.add(u);

  AppUser getUserById(String id) => _users.firstWhere((e) => e.id == id);

  void deleteComment(String id) {
    _post.comments.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void changeSortType(CommentSortType type) {
    if (type == sortType) return;
    sortType = type;
    if (sortType == CommentSortType.TOP) {
      _post.comments.sort((a, b) => b.likesCount.compareTo(a.likesCount));
    } else {
      _post.comments.sort((a, b) => b.date.compareTo(a.date));
    }
    notifyListeners();
  }
}
