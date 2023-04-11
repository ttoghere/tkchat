import 'package:get/get.dart';
import 'package:tkchat/pages/chat/controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
