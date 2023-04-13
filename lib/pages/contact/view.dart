import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tkchat/common/common.dart';
import 'package:tkchat/pages/contact/index.dart';
import 'package:tkchat/pages/contact/widgets/contact_list.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ContactList(),
    );
  }

  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Text(
      "Contact",
      style: TextStyle(
          color: AppColors.primaryBackground,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600),
    ));
  }
}
