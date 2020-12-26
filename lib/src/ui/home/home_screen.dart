import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/assets/app_images.dart';
import 'package:flutter_social_media_app/src/constants/app_text_constants.dart';
import 'package:flutter_social_media_app/src/ui/create_post/create_post_screen.dart';
import 'package:flutter_social_media_app/src/ui/posts/posts_screen.dart';
import 'package:flutter_social_media_app/src/ui/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      CreatePostScreen(),
      PostsScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: screens[_tabIndex],
      bottomNavigationBar: _bottomNavigationBar(_tabIndex),
    );
  }

  void _onTap(int type) {
    setState(() {
      _tabIndex = type;
    });
  }

  Widget _bottomNavigationBar(int _tabIndex) {
    final List<Map<String, dynamic>> menuList = <Map<String, dynamic>>[
      <String, dynamic>{
        'icon': Icon(Icons.home),
        // 'activeIcon': AppImages.homeActive(context),
        'title': AppTextConstants.CREATE_POST
      },
      <String, dynamic>{
        'icon': Icon(Icons.post_add),
        // 'activeIcon': AppImages.homeActive(context),
        'title': AppTextConstants.POSTS
      },
      <String, dynamic>{
        'icon': Icon(Icons.supervised_user_circle),
        // 'activeIcon': AppImages.homeActive(context),
        'title': AppTextConstants.PROFILE,
      },
    ];
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).backgroundColor,
      type: BottomNavigationBarType.fixed,
      items: List.generate(menuList.length, (int index) {
        final Map item = menuList[index];
        return BottomNavigationBarItem(
          icon: item['icon'],
          label: item['title'],
        );
      }).toList(),
      onTap: _onTap,
      currentIndex: _tabIndex,
    );
  }
}
