import 'package:get/get.dart';
import 'package:tkchat/pages/welcome/index.dart';

class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();
  changePage(int index) async {
    state.index.value = index;
  }
}
