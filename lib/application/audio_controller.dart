// Dart imports:
import 'dart:math';

// Package imports:
import 'package:audioplayers/audioplayers.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:words625/gen/assets.gen.dart';

@injectable
class AudioController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final Random _random = Random();

  // List of error sound assets
  final List<String> _errorSounds = [
    Assets.sounds.error1,
    Assets.sounds.error2,
    Assets.sounds.error3,
    Assets.sounds.error4,
  ];

  // List of level-up sound assets
  final List<String> _levelUpSounds = [
    Assets.sounds.levelUp1,
    Assets.sounds.levelUp2,
    Assets.sounds.levelUp3,
    Assets.sounds.levelUp4,
  ];

  Future<void> playRandomErrorSound() async {
    int index = _random.nextInt(_errorSounds.length);
    String selectedErrorSound = _errorSounds[index];
    await _playSound(selectedErrorSound);
  }

  Future<void> playRandomLevelUpSound() async {
    int index = _random.nextInt(_levelUpSounds.length);
    String selectedLevelUpSound = _levelUpSounds[index];
    await _playSound(selectedLevelUpSound);
  }

  Future<void> _playSound(String assetPath) async {
    try {
      // need to remove the assets/ prefix from the asset path
      final String path = assetPath.replaceFirst('assets/', '');
      await _audioPlayer.play(AssetSource(path));
    } catch (e) {
      print('Error playing sound: $e');
    }
  }
}
