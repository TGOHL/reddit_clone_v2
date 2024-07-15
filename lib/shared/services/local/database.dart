import 'package:flutter/material.dart';
import 'package:reddit_clone/shared/config/assets.dart';
import 'package:reddit_clone/shared/enums/comment_sort.dart';
import 'package:reddit_clone/shared/models/app/comment.dart';
import 'package:reddit_clone/shared/models/app/post.dart';
import 'package:reddit_clone/shared/models/user/app_user.dart';

class DatabaseService with ChangeNotifier {
  CommentSortType sortType = CommentSortType.NEW;
  final List<AppUser> _users = [
    AppUser(
      id: 'user_a',
      name: "Maleficent-Bid-3006",
      imageUrl: AppAssets.PROFILE_1_IMAGE,
    ),
    AppUser(
      id: 'user_b',
      name: "justYourAvgHumanoid",
      imageUrl: AppAssets.PROFILE_2_IMAGE,
    ),
    AppUser(
      id: 'user_c',
      name: "ducksdotoo",
      imageUrl: AppAssets.PROFILE_3_IMAGE,
    ),
    AppUser(
      id: 'user_d',
      name: "shallow_water_hunter",
      imageUrl: AppAssets.PROFILE_4_IMAGE,
    ),
    AppUser(
      id: 'user_e',
      name: "LilacTorment",
      imageUrl: AppAssets.PROFILE_5_IMAGE,
    ),
    AppUser(
      id: 'user_f',
      name: "MGS1234V",
      imageUrl: AppAssets.PROFILE_6_IMAGE,
    ),
    AppUser(
      id: 'user_g',
      name: "Xytakis",
      imageUrl: AppAssets.PROFILE_3_IMAGE,
    ),
  ];

  final Post _post = Post(
    id: "post_1",
    autherId: "user_a",
    reddit: 'aww',
    content: "Awwwww......now that's cute ❤",
    attachmentUrl:
        'https://packaged-media.redd.it/eavt3ufuvghc1/pb/m2-res_1920p.mp4?m=DASHPlaylist.mpd&v=1&e=1721052000&s=645ae0327b9210a5c83b2ed4d2562ef187ef0a4c#t=0',
    date: DateTime.now().subtract(const Duration(days: 4, hours: 5)),
    likesCount: 896,
    comments: [
      CommentModel(
        id: 'comment_1',
        autherId: 'user_b',
        content: "Holy crap, how damn adorable!!",
        likesCount: 36,
        date: DateTime.now().subtract(const Duration(minutes: 5)),
        replys: [
          CommentModel(
            id: 'comment_2',
            autherId: 'user_a',
            content: "Thank you! He cracks me up🤣. Always belting out a tune!",
            likesCount: 19,
            date: DateTime.now().subtract(const Duration(minutes: 22)),
            replys: [
              CommentModel(
                id: 'comment_3',
                autherId: 'user_c',
                content: "I love it when my dog sings with me! The neighbors probably don't.",
                likesCount: 4,
                date: DateTime.now().subtract(const Duration(minutes: 15)),
                replys: [
                  CommentModel(
                    id: 'comment_4',
                    autherId: 'user_a',
                    content: "🤣🤣🤣",
                    likesCount: 2,
                    date: DateTime.now().subtract(const Duration(minutes: 15)),
                    replys: [],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      CommentModel(
        id: 'comment_5',
        autherId: 'user_d',
        content: "Soo darn cute. Your blessed!",
        likesCount: 20,
        date: DateTime.now().subtract(const Duration(minutes: 15)),
        replys: [
          CommentModel(
            id: 'comment_6',
            autherId: 'user_a',
            content: "I am blessed! This pup has stolen my heart❤. He is a character!",
            likesCount: 15,
            date: DateTime.now().subtract(const Duration(minutes: 15)),
            replys: [],
          ),
        ],
      ),
      CommentModel(
        id: 'comment_7',
        autherId: 'user_e',
        content: "Look at those teddy bear paws! Exceptionally cute",
        likesCount: 17,
        date: DateTime.now().subtract(const Duration(minutes: 15)),
        replys: [
          CommentModel(
            id: 'comment_8',
            autherId: 'user_a',
            content: "Thank you! I am so pleased you noticed his paws! I am absolutely anal about NO \"Grinch Feet\"😱",
            likesCount: 9,
            isLoaded: false,
            date: DateTime.now().subtract(const Duration(minutes: 15)),
            replys: [],
          ),
        ],
      ),
      CommentModel(
        id: 'comment_9',
        autherId: 'user_f',
        content: "Prime r/tinyawoos material",
        likesCount: 11,
        date: DateTime.now().subtract(const Duration(minutes: 15)),
        replys: [
          CommentModel(
            id: 'comment_10',
            autherId: 'user_a',
            content:
                "I saw the cute Husky video and it inspired me to post my singing Pom. I was going to title it \"My Pom thinks he is a Husky\"😂",
            likesCount: 6,
            date: DateTime.now().subtract(const Duration(minutes: 15)),
            replys: [],
          ),
        ],
      ),
      CommentModel(
        id: 'comment_11',
        autherId: 'user_g',
        content: "Talkative little fellow",
        likesCount: 6,
        date: DateTime.now().subtract(const Duration(minutes: 15)),
        replys: [],
      ),
    ],
  );

  List<AppUser> get users => [..._users];
  List<CommentModel> get comments => [..._post.comments];

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
