import 'package:get/get.dart';
import 'package:tkchat/pages/profile/index.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
