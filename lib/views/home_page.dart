import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hangman/constants/size_constants.dart';
import 'package:hangman/controller/game/game_controller.dart';
import 'package:hangman/views/admin_view.dart';
import 'package:hangman/views/game/game_view.dart';
import 'package:hangman/views/profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = '/homeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
      
  late final TabController _tabController;
  bool isInitialized = false;

  @override
  void initState() {
    if (views.length != tabs.length) throw 'views and tabs must be same length';
    _tabController = TabController(length: tabs.length, vsync: this);

    Get.put(GameController());
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      pagePaddingHorizontal = MediaQuery.of(context).size.width * 0.04;
      pagePaddingVertical = MediaQuery.of(context).size.height * 0.02;
      isInitialized = true;
    }

    return Scaffold(
      extendBody: true,
      body: TabBarView(
        controller: _tabController,
        children: views,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          left: pagePaddingHorizontal,
          right: pagePaddingHorizontal,
          top: pagePaddingVertical,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: TabBar(
          controller: _tabController,
          indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
          dividerHeight: 0,
          tabs: tabs,
        ),
      ),
    );
  }

  final tabs = <Widget>[
    const Tab(
      icon: Icon(Icons.gamepad),
    ),
    const Tab(
      icon: Icon(Icons.person),
    ),
    const Tab(
      icon: Icon(Icons.admin_panel_settings),
    ),
  ];

  final views = [
    GameView(),
    const ProfileView(),
    AdminView(),
  ];
}
