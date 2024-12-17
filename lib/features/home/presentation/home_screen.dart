import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/features/home/presentation/educational_insides/presentation/educational_insides.dart';
import 'package:genzeh911/features/home/presentation/home_body_screen.dart';
import 'package:genzeh911/features/notification/presentation/notification_screen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.icons.menu)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
                onTap: () {
                  Get.to(() => NotificationScreen());
                },
                child: SvgPicture.asset(Assets.icons.notification)),
          )
        ],
        title: Text(
          'Logoipsum',
          style: TextStyle(
            color: AppColors.c55D0FF,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          //home widgets
          HomeBodyScreen(),
          EducationalInsides()
        ],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: <NavigationDestination>[
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.insights_rounded), label: 'Insides'),
            NavigationDestination(icon: Icon(Icons.history), label: 'History'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}
