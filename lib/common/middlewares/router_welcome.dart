import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkchat/common/routes/routes.dart';
import 'package:tkchat/common/store/store.dart';

///Welcome Page routing actions
class RouteWelcomeMiddleware extends GetMiddleware {
  // Number priority --> Small numbers have high priority
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(ConfigStore.to.isFirstOpen);
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return RouteSettings(name: AppRoutes.Application);
    } else {
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
