import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/features/home/presentation/widgets/daily_content.dart';
import 'package:quran_app/features/home/presentation/widgets/hajr_date.dart';
import 'package:quran_app/features/home/presentation/widgets/home_app_bar.dart';
import 'package:quran_app/features/home/presentation/widgets/home_items.dart';
import 'package:quran_app/features/home/presentation/widgets/prayer_times_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: CustomScrollView(
          slivers: [
            //! Hijri Date Widget
            SliverToBoxAdapter(child: FadeInUp(child: const HijriDate())),
            const SliverToBoxAdapter(child: SizedBox(height: 18)),
            //! home Items
            const SliverToBoxAdapter(child: HomeItems()),
            const SliverToBoxAdapter(child: SizedBox(height: 18)),
            //! prayer Times Widget
            const SliverToBoxAdapter(child: PrayerTimesHomeWidget()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            //! Daily Zekr + Daily Ayah + Daily Doaa
            const SliverToBoxAdapter(child: DailyContent()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
