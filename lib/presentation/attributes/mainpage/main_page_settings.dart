import 'package:flutter/material.dart';
import 'package:flutter_app_test/presentation/attributes/mainpage/main_page_language_sellection.dart';
import 'package:flutter_app_test/presentation/home.dart';
import 'package:flutter_app_test/utils/config.dart';
import 'package:flutter_app_test/utils/localization/localization_constants.dart';
import 'package:flutter_app_test/utils/theme/theme_mode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainPageSettings extends StatefulWidget {
  const MainPageSettings({super.key});

  @override
  State<MainPageSettings> createState() => _MainPageSettingsState();
}

class _MainPageSettingsState extends State<MainPageSettings> {
  String _language = '';

  void _changeLanguage(Locale locale) {
    setLocale(locale.toString());
    Home.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          getTranslated(context, 'pengaturan') ?? '',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18,
                fontWeight: Config.bold,
              ),
        ),
        SizedBox(height: 5.h),
        ListTile(
          minLeadingWidth: 10,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            getTranslated(context, 'bahasa') ?? '',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  fontWeight: Config.bold,
                ),
          ),
          leading: Icon(
            Icons.language_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<String>(
                builder: (_) => MainPageLanguageSelection(
                  title: getTranslated(context, 'pilih_bahasa') ?? '',
                  listTile: <String>[
                    getTranslated(context, 'indonesia') ?? '',
                    getTranslated(context, 'inggris') ?? '',
                  ],
                ),
              ),
            ).then((dynamic cb) {
              if (cb != null) {
                setState(() => _language = cb as String);
                if (cb == getTranslated(context, 'indonesia')) {
                  _changeLanguage(const Locale('id', 'ID'));
                } else {
                  _changeLanguage(const Locale('en', 'US'));
                }
              }
            });
          },
          trailing: Icon(Icons.navigate_next_sharp,
              color: Theme.of(context).iconTheme.color),
        ),
        ListTile(
          leading: Icon(Icons.dark_mode_outlined,
              color: Theme.of(context).iconTheme.color),
          minLeadingWidth: 10,
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            getTranslated(context, 'mode_gelap') ?? '',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 14,
                  fontWeight: Config.bold,
                ),
          ),
          trailing: Switch(
            thumbColor: Theme.of(context).brightness == Brightness.dark
                ? MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor)
                : null,
            trackColor: Theme.of(context).brightness == Brightness.dark
                ? MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor.withOpacity(0.5))
                : null,
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (bool value) async {
              await context
                  .read<ThemeModeCustom>()
                  .changeTheme(darkMode: value);
            },
            activeTrackColor: Theme.of(context).primaryColor.withOpacity(0.3),
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
