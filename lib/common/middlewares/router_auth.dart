import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkchat/common/routes/routes.dart';
import 'package:tkchat/common/store/store.dart';

/// Auth page routing actions
class RouteAuthMiddleware extends GetMiddleware {
  // Number priority --> Small numbers have high priority
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin || route == AppRoutes.SIGN_IN || route == AppRoutes.INITIAL) {
      return null;
    } else {
      Future.delayed(
          Duration(seconds: 1), () => Get.snackbar("提示", "登录过期,请重新登录"));
      return RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
