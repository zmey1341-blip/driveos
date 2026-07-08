import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/music_models.dart';

class MusicWidget extends ConsumerWidget {
  final MusicTrack? track;
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const MusicWidget({
    Key? key,
    required this.track,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          if (track != null) ...
            [
              Text(
                track!.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                track!.artist,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ]
          else
            const Text(
              'No track playing',
              style: TextStyle(color: Colors.grey),
            ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous),
                onPressed: onPrevious,
              ),
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 32,
                ),
                onPressed: onPlayPause,
              ),
              IconButton(
                icon: const Icon(Icons.skip_next),
                onPressed: onNext,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
