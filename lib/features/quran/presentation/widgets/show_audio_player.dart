import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/features/quran/presentation/widgets/audio_player_widget.dart';

Future<dynamic> showAudioPlayer({
  required BuildContext context,
  required List<AudioSource> playList,
  required int currentIndex,
}) {
  return showModalBottomSheet(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    context: context,
    builder: (context) {
      return AudioPlayerWidget(playList: playList, currentIndex: currentIndex);
    },
  );
}
