import 'package:flutter/material.dart';
import 'package:flutter_app_test/utils/config.dart';
import 'package:flutter_app_test/utils/localization/localization_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          getTranslated(context, 'login') ?? '',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 24,
                fontWeight: Config.bold,
              ),
        ),
        SizedBox(height: 4.h),
        Text(
          getTranslated(context, 'login_body') ?? '',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18,
                fontWeight: Config.regular,
              ),
        ),
      ],
    );
  }
}
