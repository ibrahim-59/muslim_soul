// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/core/utils/app_assets.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_text_style.dart';
import 'package:internet_connectivity_checker/internet_connectivity_checker.dart';
import 'package:quran_app/core/widgets/no_internet_widget.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  late AudioPlayer audioPlayer;

  bool isReady = false;
  bool isLoading = false;
  bool isPlaying = false;
  @override
  void initState() {
    audioPlayer = AudioPlayer();
    init();
    super.initState();
  }

  init() async {
    await audioPlayer.setUrl(
        "https://qurango.net/radio/tarateel?fbclid=IwAR1lmP-QVesmbRT9fxg9yRB7MA9rr-0n8bIoxozjA-HelR5PWI281nKNEKE");
    audioPlayer.playerStateStream.listen((state) {
      if (state.playing) {
        setState(() {
          isPlaying = true;
          isReady = false;
        });
      }
      switch (state.processingState) {
        case ProcessingState.idle:
          log("ProcessingState.idle");
          setState(() {
            isPlaying = false;
          });
        case ProcessingState.loading:
          setState(() {
            isLoading = true;
            isPlaying = false;
          });
          log("ProcessingState.loading");
        case ProcessingState.buffering:
          log("ProcessingState.buffering");
        case ProcessingState.ready:
          setState(() {
            if (isPlaying) {
              isReady = false;
            } else {
              isReady = true;
            }
          });
          log("ProcessingState.ready");
        case ProcessingState.completed:
          log("ProcessingState.completed");
      }
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.bny),
      backgroundColor: AppColors.bny,
      body: ConnectivityBuilder(
        builder: (ConnectivityStatus status) {
          if (status == ConnectivityStatus.online) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: Center(
                    child: Image.asset(Assets.assetsQurankarem),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  "راديو القرأن الكريم",
                  style: CustomTextStyles.change24W600
                      .copyWith(color: AppColors.offwhite),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                      "يعمل علي مدار الساعة ليذيع أجمل تلاوات وختمات القرأن الكريم لمشاهير القراء",
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.change18w400
                          .copyWith(color: AppColors.whiteColor)),
                ),
                const SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: IconButton(
                      onPressed: () async {
                        if (isReady) {
                          await audioPlayer.play();
                        } else {
                          await audioPlayer.stop();
                          isPlaying = false;
                          isReady = true;
                          setState(() {});
                        }
                      },
                      iconSize: 60,
                      color: AppColors.primaryColor,
                      icon: isReady
                          ? const Icon(Icons.play_arrow_rounded)
                          : isPlaying
                              ? const Icon(Icons.pause_rounded)
                              : isLoading
                                  ? const CircularProgressIndicator(
                                      color: AppColors.primaryColor)
                                  : const CircularProgressIndicator(
                                      color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ],
            );
          } else if (status == ConnectivityStatus.offline) {
            return const NoInternetWidget();
          } else {
            return const Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            );
          }
        },
      ),
    );
  }
}
