import 'package:get/get.dart';
import 'package:tkchat/pages/message/chat/index.dart';
import 'package:tkchat/pages/message/controller.dart';

class MessageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
