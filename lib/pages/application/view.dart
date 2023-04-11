import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tkchat/common/style/style.dart';
import 'package:tkchat/common/values/values.dart';
import 'package:tkchat/pages/application/index.dart';
import 'package:tkchat/pages/contact/index.dart';

class ApplicationPage extends GetView<ApplicationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handPageChanged,
      children: [
        const Center(
          child: SizedBox(
            child: Text("Chat"),
          ),
        ),
        ContactPage(),
        const Center(
          child: SizedBox(
            child: Text("Profile"),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          controller.handNavBarTap(value);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.tabBarElement,
        backgroundColor: Colors.red[900],
        selectedItemColor: AppColors.thirdElementText,
        selectedLabelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
