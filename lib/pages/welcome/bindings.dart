import 'package:get/get.dart';
import 'package:tkchat/pages/welcome/controller.dart';

//Using for clean dependency injection
class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
