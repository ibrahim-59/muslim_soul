import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/features/quran/data/position_data.dart';
import 'package:quran_app/features/quran/presentation/widgets/controls.dart';
import 'package:quran_app/features/quran/presentation/widgets/media_meta_data.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget(
      {super.key, required this.playList, required this.currentIndex});
  final List<AudioSource> playList;
  final int currentIndex;

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer audioPlayer;
  late ConcatenatingAudioSource playList;
  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          audioPlayer.positionStream,
          audioPlayer.bufferedPositionStream,
          audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
                position: position,
                bufferedPosition: bufferedPosition,
                duration: duration ?? Duration.zero,
              ));
  @override
  void initState() {
    playList = ConcatenatingAudioSource(children: widget.playList);
    audioPlayer = AudioPlayer();

    init();

    super.initState();
  }

  Future<void> init() async {
    await audioPlayer.setLoopMode(LoopMode.all);
    await audioPlayer.setAudioSource(playList);
    await audioPlayer.seek(Duration.zero, index: widget.currentIndex);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state?.sequence.isEmpty ?? true) {
                return const SizedBox.shrink();
              }
              final metaData = state!.currentSource!.tag as MediaItem;
              return MediaMetaData(
                  imageUrl: metaData.album!,
                  title: metaData.title,
                  artist: metaData.artist ?? "");
            },
          ),
          const SizedBox(height: 10),
          StreamBuilder<PositionData>(
            stream: positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ProgressBar(
                  progress: positionData?.position ?? Duration.zero,
                  buffered: positionData?.bufferedPosition ?? Duration.zero,
                  total: positionData?.duration ?? Duration.zero,
                  onSeek: audioPlayer.seek,
                  barHeight: 8,
                  baseBarColor: AppColors.greyColor,
                  bufferedBarColor: Colors.grey,
                  progressBarColor: AppColors.primaryColor,
                  thumbColor: AppColors.primaryColor,
                  timeLabelTextStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
              );
            },
          ),
          Controls(audioPlayer: audioPlayer, currentIndex: widget.currentIndex),
        ],
      ),
    );
  }
}
