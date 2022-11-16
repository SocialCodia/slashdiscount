import 'package:audioplayers/audioplayers.dart';
import 'package:slashdiscount/utils/constants.dart';

class AudioHelpers {
  static final player = AudioPlayer();

  static Future<void> playBeep() async {
    player.play(AssetSource(Constants.soundBeep),volume: 0.1);
  }

}
