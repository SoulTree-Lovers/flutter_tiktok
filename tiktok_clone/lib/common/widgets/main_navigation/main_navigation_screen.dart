import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:tictok_clone/constants/gaps.dart';
import 'package:tictok_clone/constants/sizes.dart';
import 'package:tictok_clone/features/discover/discover_screen.dart';
import 'package:tictok_clone/common/widgets/main_navigation/stf_screen.dart';
import 'package:tictok_clone/common/widgets/main_navigation/widgets/nav_tab.dart';
import 'package:tictok_clone/common/widgets/main_navigation/widgets/post_video_button.dart';
import 'package:tictok_clone/features/users/views/user_profile_screen.dart';
import 'package:tictok_clone/features/inbox/inbox_screen.dart';
import 'package:tictok_clone/features/videos/views/video_recording_screen.dart';
import 'package:tictok_clone/features/videos/views/video_timeline_screen.dart';
import 'package:tictok_clone/utils/utils.dart';

class MainNavigationScreen extends StatefulWidget {
  static const String routeName = "main_navigation";
  static const String routeUrl = "/main";

  final String tab;

  const MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final List<String> _tabs = [
    "home", "discover", "xxxx", "inbox", "profile",
  ];

  late int _currentIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    context.go("/${_tabs[index]}");
    setState(() {
      _currentIndex = index;
    });
    print('Current Index: $_currentIndex');
  }

  void _onPostVideoButtonTap() {
    context.pushNamed(VideoRecordingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 키보드가 올라와도 화면이 줄어들지 않음
      backgroundColor: _currentIndex == 0 || isDarkMode(context)
          ? Colors.black
          : Colors.white,
      body: Stack(
        children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: DiscoverScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 3,
            child: InboxScreen(),
          ),
          Offstage(
            offstage: _currentIndex != 4,
            child: UserProfileScreen(
              username: "johndoe",
              tab: "",
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _currentIndex == 0 || isDarkMode(context)
            ? Colors.black
            : Colors.white,
        height: Sizes.size40 * 2.6,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavTab(
                text: "Home",
                isSelected: _currentIndex == 0,
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.house,
                onTap: () => _onTap(0),
                currentIndex: _currentIndex,
              ),
              NavTab(
                text: "Discover",
                isSelected: _currentIndex == 1,
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                onTap: () => _onTap(1),
                currentIndex: _currentIndex,
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(
                  inverted: _currentIndex != 0,
                ),
              ),
              Gaps.h24,
              NavTab(
                text: "Inbox",
                isSelected: _currentIndex == 3,
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                onTap: () => _onTap(3),
                currentIndex: _currentIndex,
              ),
              NavTab(
                text: "Profile",
                isSelected: _currentIndex == 4,
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                onTap: () => _onTap(4),
                currentIndex: _currentIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
