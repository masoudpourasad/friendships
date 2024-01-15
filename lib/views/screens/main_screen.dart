import 'package:flutter/material.dart';
import 'package:friendships/views/screens/chat/chats.dart';
import 'package:friendships/views/screens/friends.dart';
import 'package:friendships/views/screens/home.dart';
import 'package:friendships/views/screens/notifications.dart';
import 'package:friendships/views/screens/profile.dart';
import 'package:friendships/views/widgets/icon_badge.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController(initialPage: 2);
  bool _isFabVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          setState(() {
            _isFabVisible = notification.scrollDelta! < 0;
          });
          return true;
        },
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: const <Widget>[
            Chats(),
            Friends(),
            Home(),
            Notifications(),
            Profile(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _isFabVisible ? const Floatingactionbutton() : null,
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {}
}

class Floatingactionbutton extends StatelessWidget {
  const Floatingactionbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.symmetric(horizontal: 80),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.4),
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.message, color: Colors.white),
              onPressed: () => _navigateToPage(context, 0),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.group, color: Colors.white),
              onPressed: () => _navigateToPage(context, 1),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () => _navigateToPage(context, 2),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const IconBadge(
                  icon: Icons.notifications, color: Colors.white),
              onPressed: () => _navigateToPage(context, 3),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () => _navigateToPage(context, 4),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(BuildContext context, int page) {
    final mainScreenState = context.findAncestorStateOfType<_MainScreenState>();
    mainScreenState?.navigationTapped(page);
  }
}
