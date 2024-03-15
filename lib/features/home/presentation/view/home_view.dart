import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:quran_app/features/home/presentation/view/home.dart';
import 'package:quran_app/features/home/presentation/view/menu_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: const MenuScreenPage(),
      mainScreen: const HomePage(),
      angle: 0,
      mainScreenScale: 0.1,
      borderRadius: 40,
      isRtl: true,
      menuBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      menuScreenWidth: 260,
    );
  }
}
