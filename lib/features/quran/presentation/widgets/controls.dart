import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/core/utils/app_colors.dart';

class Controls extends StatelessWidget {
  const Controls(
      {super.key, required this.audioPlayer, required this.currentIndex});
  final AudioPlayer audioPlayer;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            onPressed: audioPlayer.seekToNext,
            icon: Container(
              width: size.width / 8.5,
              height: size.width / 8.5,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: const Icon(Icons.skip_next_rounded,
                  size: 35, color: AppColors.primaryColor),
            )),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playeState = snapshot.data;
            final processingState = playeState?.processingState;
            final playing = playeState?.playing;
            if (snapshot.hasError) {
              return Container(
                  width: size.width / 8,
                  height: size.width / 8,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: const CircularProgressIndicator());
            }
            if (!(playing ?? false)) {
              return IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  onPressed: () async {
                    await audioPlayer.play();
                  },
                  icon: Container(
                    width: size.width / 8,
                    height: size.width / 8,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: const Icon(Icons.play_arrow_rounded,
                        size: 40, color: AppColors.primaryColor),
                  ));
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  onPressed: audioPlayer.pause,
                  icon: Container(
                    width: size.width / 8,
                    height: size.width / 8,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: const Icon(Icons.pause,
                        size: 40, color: AppColors.primaryColor),
                  ));
            }
            return Container(
              width: size.width / 8,
              height: size.width / 8,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: const Icon(Icons.play_arrow_rounded,
                  size: 40, color: AppColors.primaryColor),
            );
          },
        ),
        IconButton(
            onPressed: audioPlayer.seekToPrevious,
            icon: Container(
              width: size.width / 8.5,
              height: size.width / 8.5,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: const Icon(Icons.skip_previous_rounded,
                  size: 35, color: AppColors.primaryColor),
            )),
      ],
    );
  }
}
