import 'dart:convert';
import 'package:get/get.dart';
import 'package:tkchat/common/entities/entities.dart';
import 'package:tkchat/common/services/services.dart';
import 'package:tkchat/common/values/values.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  //Check the users log action
  final _isLogin = false.obs;
  //Saves the user token
  String token = '';
  //Saves the user profile data
  final _profile = UserLoginResponseEntity().obs;

  //getter for log action
  bool get isLogin => _isLogin.value;
  //getter for profile data
  UserLoginResponseEntity get profile => _profile.value;
  //getter for user token
  bool get hasToken => token.isNotEmpty;

  //What happens when this (onInit) method runs.
  @override
  void onInit() {
    super.onInit();
    //token assings to this variable when it saved on getString key
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    //Call the profile data when the user is offline
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    //Profile null safety
    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _profile(UserLoginResponseEntity.fromJson(jsonDecode(profileOffline)));
    }
  }

  //Assigns the token data to a string key
  Future<void> setToken(String value) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  //Calls the profile data via token
  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    // var result = await UserAPI.profile();
    // _profile(result);
    // _isLogin.value = true;
   return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  //Saves the profile data to database via http
  Future<void> saveProfile(UserLoginResponseEntity profile) async {
    _isLogin.value = true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
    setToken(profile.accessToken!);
  }

  // Http Logout method
  Future<void> onLogout() async {
   // if (_isLogin.value) await UserAPI.logout();
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    _isLogin.value = false;
    token = '';
  }
}
