import 'package:flutter/material.dart';
import 'package:flutter_app_test/presentation/login_page.dart';
import 'package:flutter_app_test/presentation/main_page.dart';
import 'package:flutter_app_test/providers/google_sign_in_provider.dart';
import 'package:flutter_app_test/utils/change_statusbar_color.dart';
import 'package:flutter_app_test/utils/localization/custom_localization.dart';
import 'package:flutter_app_test/utils/localization/localization_constants.dart';
import 'package:flutter_app_test/utils/theme/theme_data_custom.dart';
import 'package:flutter_app_test/utils/theme/theme_mode.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Home extends StatefulWidget {
  //Function for set Local attribute in _MyAppState class from other class
  static void setLocale(BuildContext context, Locale locale) {
    final HomeBodyState? state =
        context.findAncestorStateOfType<HomeBodyState>();
    state!.setLocale(locale);
  }

  @override
  State createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ThemeModeCustom>(
          create: (_) => ThemeModeCustom(),
        ),
        ChangeNotifierProvider<GoogleSignInProvider>(
          create: (_) => GoogleSignInProvider(),
        ),
      ],
      child: const HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State createState() {
    return HomeBodyState();
  }
}

class HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  ///Define default Locale variable
  late Locale? _locale;

  ///function for set local attribute class from parent class (MyApp)
  void setLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  ///like initStete function, this function run for provide code when class was loaded
  @override
  void didChangeDependencies() {
    getLocale().then((Locale? locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  HomeBodyState();

  @override
  void initState() {
    super.initState();
    // _silentLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThemeMode>(
      future: context.watch<ThemeModeCustom>().themeMode,
      builder: (_, AsyncSnapshot<ThemeMode> snapshot) {
        if (snapshot.data == ThemeMode.dark) {
          changeStatusBarColor(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent);
        } else {
          changeStatusBarColor(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent);
        }

        return ScreenUtilInit(
          designSize: const Size(360, 640),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return snapshot.hasData
                ? MaterialApp(
                    title: 'MooFoods',
                    theme: ThemeDataCustom.light,
                    darkTheme: ThemeDataCustom.dark,
                    themeMode: snapshot.data,
                    debugShowCheckedModeBanner: false,
                    initialRoute: '/',
                    //Add default locale class to MaterialApp locale attribute
                    locale: _locale,
                    supportedLocales: const <Locale>[
                      Locale('en', 'US'),
                      Locale('id', 'ID')
                    ],
                    //Add buildup delegate and custom delegate that we made
                    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                      CustomLocalizations.delegate, //Custom delegate
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    //Create callback logic for locale
                    localeResolutionCallback:
                        (Locale? locale, Iterable<Locale> supportedLocales) {
                      for (final Locale supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode ==
                                locale!.languageCode &&
                            supportedLocale.countryCode == locale.countryCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales
                          .first; //if default locale not support, use first local in supportedLocales list (english)
                    },
                    home: child,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
          child: const LoginPage(),
        );
      },
    );
  }
}
