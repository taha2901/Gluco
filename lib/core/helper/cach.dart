import 'package:shared_preferences/shared_preferences.dart';

class ChachHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool>? removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<int?> getLikes({required String postId}) async {
    return sharedPreferences!.getInt('likes_$postId');
  }

  static Future<void> incrementLikes({required String postId}) async {
    int currentLikes = await getLikes(postId: postId) ?? 0;
    await saveData(key: 'likes_$postId', value: currentLikes + 1);
  }
}
