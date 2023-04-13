import 'package:get/get.dart';
import 'package:tkchat/pages/application/index.dart';
import 'package:tkchat/pages/contact/index.dart';
import 'package:tkchat/pages/message/controller.dart';
import 'package:tkchat/pages/profile/index.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
