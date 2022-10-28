import 'package:flutter/material.dart';
import 'package:flutter_app_test/presentation/attributes/login/login_button.dart';
import 'package:flutter_app_test/presentation/attributes/login/login_page_header.dart';
import 'package:flutter_app_test/presentation/home.dart';
import 'package:flutter_app_test/presentation/main_page.dart';
import 'package:flutter_app_test/providers/google_sign_in_provider.dart';
import 'package:flutter_app_test/utils/animation_navigation.dart';
import 'package:flutter_app_test/utils/config.dart';
import 'package:flutter_app_test/utils/theme/theme_data_custom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final GoogleSignInProvider googleProvider =
        Provider.of<GoogleSignInProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const LoginPageHeader(),
          LoginButton(
            onTap: () => googleProvider.googleLogin().then((dynamic value) {
              print(value);
              Navigator.of(context).pushAndRemoveUntil(
                AnimationRoute(
                  child: const MainPage(),
                ),
                (Route<void> route) => false,
              );
            }),
          )
        ],
      ),
    );
  }
}
