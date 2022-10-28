import 'package:shared_preferences/shared_preferences.dart';

Future<void> changePrefsLogin(Map<String, dynamic> userMap) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString(
      'user_email', userMap['email'] != null ? userMap['email'] as String : '');
  await prefs.setString('user_password',
      userMap['password'] != null ? userMap['password'] as String : '');
  await prefs.setString('token', userMap['token'] as String);
}

Future<Map<String, String>> getPrefsProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return <String, String>{
    'user_email': prefs.getString('user_email') ?? '',
    'user_password': prefs.getString('user_password') ?? '',
    'token': prefs.getString('token') ?? ''
  };
}
