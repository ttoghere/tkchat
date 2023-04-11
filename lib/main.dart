// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:tkchat/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

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
    //We have to wrap material with ScreenUtilInit
    //This wrap action let us to use adaptive sizes in app
    return ScreenUtilInit(
      builder: (context, child) {
        //Must implement widget GetMaterial app
        //For using get package features in app
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TKChat',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //MaterialApp --> routes
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
        );
      },
    );
  }
}

