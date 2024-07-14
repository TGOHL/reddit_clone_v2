import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoTimePlayer extends StatefulWidget {
  final VideoPlayerController controller;
  final Function(bool play)? onPlay;
  final Function(bool mute)? onMute;
  final bool isExtened;
  const VideoTimePlayer({
    super.key,
    this.onPlay,
    this.onMute,
    this.isExtened = true,
    required this.controller,
  });

  @override
  State<VideoTimePlayer> createState() => _VideoTimePlayerState();
}

class _VideoTimePlayerState extends State<VideoTimePlayer> {
  bool isPlaying = true;
  bool isMuted = false;
  double timeRemainning = 0;
  double timePassed = 0;
  double timeTotal = 0;
  double volume = 0;
  bool isSeeking = false;
  bool isExtened = true;

  @override
  void initState() {
    timeRemainning = widget.controller.value.duration.inSeconds.toDouble();
    timeTotal = widget.controller.value.duration.inSeconds.toDouble();
    volume = widget.controller.value.volume;
    isExtened = widget.isExtened;
    widget.controller.addListener(_videoPositionListener);
    super.initState();
  }

  void _videoPositionListener() {
    if (isSeeking) return;
    final Duration currentPosition = widget.controller.value.position;
    setState(() {
      timePassed = currentPosition.inSeconds.toDouble();
      timeRemainning = timeTotal - currentPosition.inSeconds.toDouble();
    });
  }

  @override
  void didUpdateWidget(VideoTimePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    isExtened = widget.isExtened;
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_videoPositionListener);
  }

  String get timeLeft {
    int min = timeRemainning ~/ 60;
    int sec = timeRemainning.toInt() % 60;
    String value = min > 9 ? "" : "0";
    value += '$min:';
    if (sec < 10) value += '0';
    value += '$sec';
    return value;
  }

  @override
  Widget build(BuildContext context) {
    if (!isExtened) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                isPlaying = !isPlaying;
                isPlaying ? widget.controller.play() : widget.controller.pause();
                widget.onPlay ?? (isPlaying);
              });
            },
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 28.w,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isMuted = !isMuted;
                if (isMuted) {
                  volume = widget.controller.value.volume;
                  widget.controller.setVolume(0);
                } else {
                  widget.controller.setVolume(volume);
                }

                widget.onMute ?? (isMuted);
              });
            },
            icon: Icon(
              isMuted ? Icons.volume_off : Icons.volume_up,
              size: 28.w,
            ),
          ),
        ],
      );
    }
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              isPlaying = !isPlaying;
              isPlaying ? widget.controller.play() : widget.controller.pause();
              widget.onPlay ?? (isPlaying);
            });
          },
          icon: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            size: 28.w,
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderThemeData(
              overlayShape: SliderComponentShape.noOverlay,
              trackHeight: 2,
              trackShape: const RectangularSliderTrackShape(),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            ),
            child: Slider.adaptive(
              value: timePassed,
              min: 0,
              max: timeTotal,
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
              onChangeStart: (value) {
                isSeeking = true;
              },
              onChangeEnd: (value) {
                widget.controller.seekTo(Duration(seconds: value.round()));
                isSeeking = false;
              },
              onChanged: (val) {
                setState(() {
                  timePassed = val;
                  timeRemainning = timeTotal - val;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          timeLeft,
          style: const TextStyle(fontWeight: FontWeight.w400),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isMuted = !isMuted;
              if (isMuted) {
                volume = widget.controller.value.volume;
                widget.controller.setVolume(0);
              } else {
                widget.controller.setVolume(volume);
              }

              widget.onMute ?? (isMuted);
            });
          },
          icon: Icon(
            isMuted ? Icons.volume_off : Icons.volume_up,
            size: 28.w,
          ),
        ),
      ],
    );
  }
}
