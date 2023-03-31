import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tkchat/common/routes/routes.dart';
import 'package:tkchat/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Message App",
        theme: ThemeData(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        // home: Scaffold(
        //   body: Center(
        //     child: Text(
        //       (4 + 12).toString(),
        //       style: Theme.of(context)
        //           .textTheme
        //           .displayMedium!
        //           .copyWith(color: Colors.white),
        //     ),
        //   ),
        // ),
      );
    });
  }
}
