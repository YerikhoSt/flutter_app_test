import 'package:flutter/material.dart';
import 'package:flutter_app_test/utils/config.dart';
import 'package:flutter_app_test/utils/localization/localization_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  final void Function() onTap;
  const LoginButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        margin: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).indicatorColor.withOpacity(0.2),
              blurRadius: 3,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/google.png',
              width: 20.w,
              height: 20.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              getTranslated(context, 'login_button') ?? '',
              style: Config.blackTextStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: Config.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
