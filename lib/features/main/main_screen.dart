import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic/navigation_controller.dart';
import '../ideas/ui/screens/feed_screen.dart';
import '../search/ui/screens/search_screen.dart';
import '../ideas/ui/screens/create_idea_screen.dart';
import '../chat/ui/screens/chat_list_screen.dart';
import '../profile/ui/screens/profile_screen.dart';
import '../../core/constants/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.put(NavigationController());

    final List<Widget> screens = [
      const FeedScreen(),
      const SearchScreen(),
      const CreateIdeaScreen(),
      const ChatListScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: navController.currentIndex.value,
            children: screens,
          )),
      bottomNavigationBar: Obx(() => Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: navController.currentIndex.value,
              onTap: navController.changeIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.deepBlue,
              unselectedItemColor: Colors.grey.shade400,
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: 'Create'),
                BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'Chats'),
                BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
              ],
            ),
          )),
    );
  }
}
