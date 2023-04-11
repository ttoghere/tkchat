import 'package:get/get.dart';
import 'package:tkchat/pages/application/index.dart';
import 'package:tkchat/pages/contact/index.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
  }
}