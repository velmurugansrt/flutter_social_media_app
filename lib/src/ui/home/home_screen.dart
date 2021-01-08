import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/blocs/home/home_bloc.dart';
import 'package:flutter_social_media_app/src/constants/app_text_constants.dart';
import 'package:flutter_social_media_app/src/ui/create_post/create_post_screen.dart';
import 'package:flutter_social_media_app/src/ui/posts/posts_screen.dart';
import 'package:flutter_social_media_app/src/ui/profile/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_app/src/ui/screen/base/base_screen.dart';

class HomeScreen extends BaseScreen {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> {
  int _tabIndex = 0;
  HomeBloc homeBloc;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeBloc = BlocProvider.of<HomeBloc>(context);
      homeBloc.listen(homeBlocListener);
    });
    super.initState();
  }

  void homeBlocListener(state) {
    if (state is HomeProgressState) {
      startLoader();
    } else {
      stopLoader();
    }
    if (state is HomeFailedState) {
      showAlert(state.message);
    }
  }

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
