import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../showroom/views/showroom_view.dart';
import '../../widgets/logo_widget.dart';
import '../controllers/home_controller.dart';

// showRoom
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: Get.size.width * 0.15,
          title: WalidsLogo(),
          centerTitle: true,
        ),
      ),
      drawer: Drawer(
        
      ),
      body: ShowroomView(),
      // body: PageView(
      //   controller: controller.pageController,
      //   children: [
      //     ShowroomView(),
      //     Container(),
      //     ProfileView(),
      //   ],
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (value) {
      //     controller.pageController.animateToPage(value,
      //         duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      //   },
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: AppThemes.primary,
      //   unselectedItemColor: Colors.grey,
      //   // unselectedLabelStyle: const TextStyle(fontSize: 0),
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Center(child: Icon(UniconsLine.home)),
      //       label: "",
      //       tooltip: "Show Room",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Center(child: Icon(UniconsLine.bill)),
      //       tooltip: "Notifications",
      //       label: "",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Center(child: Icon(UniconsLine.user)),
      //       tooltip: "Profile",
      //       label: "",
      //     ),
      //   ],
      // ),
    );
  }
}
