import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/generated/l10n.dart';
import 'package:reddit_clone/shared/config/assets.dart';
import 'package:reddit_clone/shared/config/styles.dart';
import 'package:reddit_clone/shared/config/themes.dart';
import 'package:reddit_clone/shared/enums/arrow.dart';
import 'package:reddit_clone/shared/models/app/comment.dart';
import 'package:reddit_clone/shared/services/local/database.dart';
import 'package:reddit_clone/shared/widgets/custom_text_styler.dart';
import 'package:timeago/timeago.dart';

import 'arrow_group.dart';

class CommentTile extends StatefulWidget {
  final CommentModel comment;
  final bool isReply;
  final String autherId;
  const CommentTile({super.key, required this.comment, this.isReply = false, required this.autherId});

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    final user = DatabaseService().getUserById(widget.comment.autherId);

    return AnimatedContainer(
      duration: const Duration(seconds: 6),
      child: Container(
        margin: EdgeInsets.only(bottom: widget.isReply ? 0 : 6.w),
        decoration: BoxDecoration(
          color: !widget.isReply ? AppThemes.main : null,
          border: !widget.isReply ? null : BorderDirectional(start: BorderSide(width: 1, color: Colors.grey.withOpacity(0.25))),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCrossFade(
              firstChild: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.comment.isLoaded = true;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 4.w, bottom: 4.w, left: 14.w),
                  padding: EdgeInsets.symmetric(
                    vertical: 4.w,
                  ),
                  alignment: Alignment.center,
                  width: ScreenUtil().screenWidth,
                  color: Colors.black,
                  child: Text(
                    '${widget.comment.replysCount + 1} ${S.current.more} ${widget.comment.replysCount > 0 ? '${S.current.replys}' : '${S.current.reply.toLowerCase()}'}',
                    style: AppStyles.h4TextStyle,
                  ),
                ),
              ),
              secondChild: Container(
                margin: EdgeInsets.only(top: 4.w),
                padding: EdgeInsets.only(left: 14.w, right: widget.isReply ? 0 : 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10.w,
                      leading: CircleAvatar(
                        backgroundColor: Colors.white12,
                        radius: 14.w,
                        backgroundImage: AssetImage(user.imageUrl),
                      ),
                      title: Row(
                        children: [
                          Text(
                            user.name,
                            style: AppStyles.h3TextStyle.copyWith(color: AppThemes.fontSecondary),
                          ),
                          if (widget.comment.autherId == widget.autherId)
                            Text(
                              ' ${S.current.op}',
                              style: AppStyles.h3TextStyle.copyWith(color: Colors.blue, fontWeight: FontWeight.w700),
                            ),
                          Text(
                            ' ∙ ${format(widget.comment.date, locale: 'en_short')}',
                            style: AppStyles.h3TextStyle.copyWith(color: AppThemes.fontSecondary),
                          ),
                        ],
                      ),
                    ),
                    CustomTextStyler(widget.comment.content, style: AppStyles.h3TextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          icon: Icon(Icons.more_horiz, size: 22.w, color: AppThemes.fontSecondary),
                        ),
                        if (widget.isReply)
                          IconButton(
                            onPressed: () {},
                            visualDensity: VisualDensity.compact,
                            icon: Image.asset(
                              AppAssets.REPLY,
                              width: 24.w,
                              color: AppThemes.fontSecondary,
                            ),
                          )
                        else
                          TextButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              AppAssets.REPLY,
                              width: 24.w,
                              color: AppThemes.fontSecondary,
                            ),
                            label: Text(
                              S.current.reply,
                              style: AppStyles.h3TextStyle.copyWith(color: AppThemes.fontSecondary),
                            ),
                          ),
                        IconButton(
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          icon: Image.asset(AppAssets.AWARD, width: 20.w, color: AppThemes.fontSecondary),
                        ),
                        ArrowGroup(
                          axis: ArrowGoupAxis.HORIZONTAL,
                          likesCount: widget.comment.likesCount,
                          fontColor: AppThemes.fontSecondary,
                          onChange: (delta) {
                            widget.comment.likesCount += delta;
                          },
                        )
                      ],
                    ),
                    if (widget.comment.replys.isNotEmpty)
                      Column(
                        children: widget.comment.replys.map((e) => CommentTile(comment: e, isReply: true, autherId: widget.autherId)).toList(),
                      ),
                  ],
                ),
              ),
              crossFadeState: widget.isReply && !widget.comment.isLoaded ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400),
            ),
          ],
        ),
      ),
    );
  }
}
