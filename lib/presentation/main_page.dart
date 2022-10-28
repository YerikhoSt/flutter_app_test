import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/meme_model.dart';
import 'package:flutter_app_test/presentation/attributes/mainpage/main_page_language_sellection.dart';
import 'package:flutter_app_test/presentation/attributes/mainpage/main_page_list_meme.dart';
import 'package:flutter_app_test/presentation/attributes/mainpage/main_page_profile_card.dart';
import 'package:flutter_app_test/presentation/attributes/mainpage/main_page_settings.dart';
import 'package:flutter_app_test/presentation/home.dart';
import 'package:flutter_app_test/services/server/server.dart';
import 'package:flutter_app_test/utils/config.dart';
import 'package:flutter_app_test/utils/localization/localization_constants.dart';
import 'package:flutter_app_test/utils/theme/theme_mode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 44.h,
          horizontal: 20.w,
        ),
        children: <Widget>[
          const MainPageProfileCard(),
          const MainPageSettings(),
          const MainPageListMeme(),
        ],
      ),
    );
  }
}
