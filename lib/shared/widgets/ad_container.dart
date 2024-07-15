import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reddit_clone/generated/l10n.dart';
import 'package:reddit_clone/shared/config/styles.dart';
import 'package:reddit_clone/shared/config/themes.dart';
import 'package:reddit_clone/shared/models/app/ad.dart';

class AdContainer extends StatelessWidget {
  final AdModel adModel;
  const AdContainer({super.key, required this.adModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      color: AppThemes.main,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16.w,
                backgroundImage: AssetImage(adModel.logoUrl),
              ),
              SizedBox(width: 8.w),
              Text(adModel.title, style: AppStyles.h3TextStyle),
              SizedBox(width: 3.w),
              Text(
                S.current.promoted,
                style: AppStyles.h3TextStyle.copyWith(color: AppThemes.fontSecondary),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, size: 20.w),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(adModel.content, style: AppStyles.h3TextStyle)),
              SizedBox(width: 12.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.w),
                child: Image.asset(
                  adModel.imageUrl,
                  width: 140.w,
                  height: 140.w,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(adModel.siteUrl, style: AppStyles.h3TextStyle),
              ),
              SizedBox(
                height: 28.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white12,
                    foregroundColor: AppThemes.fontMain,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                  ),
                  child: Text(S.current.learn_more, style: AppStyles.h3TextStyle),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
