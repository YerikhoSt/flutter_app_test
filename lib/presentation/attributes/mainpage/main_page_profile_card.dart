import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/utils/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPageProfileCard extends StatefulWidget {
  const MainPageProfileCard({Key? key}) : super(key: key);

  @override
  State<MainPageProfileCard> createState() => _MainPageProfileCardState();
}

class _MainPageProfileCardState extends State<MainPageProfileCard> {
  @override
  Widget build(BuildContext context) {
    final User? _user = FirebaseAuth.instance.currentUser;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.sp),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).indicatorColor.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 64.w,
            height: 64.w,
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(_user?.photoURL ?? ''),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _user?.displayName ?? '',
                  style: Config.blackTextStyle.copyWith(
                    fontSize: 16.sp,
                    color: Theme.of(context).primaryColor,
                    fontWeight: Config.bold,
                  ),
                  maxLines: 2,
                  textScaleFactor: 1,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  '+62 851 - 5531 - 7725',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: Config.regular,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  _user?.email ?? '',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: Config.regular,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
