import 'package:flutter/material.dart';
import 'package:gluco/features/social_media/data/user.dart';
import 'package:gluco/features/social_media/presentation/manager/services/auth.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  bool isLoad = true;
  getDetails() async {
    userModel = await FireAuthSocial().getUserDetails();
    isLoad = false;
    notifyListeners();
  }
}
