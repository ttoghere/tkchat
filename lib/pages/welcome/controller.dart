import 'package:get/get.dart';
import 'package:tkchat/pages/welcome/state.dart';

//Holds the methods for WelcomePage
class WelcomeController extends GetxController {
  final state = WelcomeState();
  WelcomeController();
  changePage(int index) async{
    state.index.value = index;
  }
}
