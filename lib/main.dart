import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.example.radioagakiza.channel.audio',
    androidNotificationChannelName: 'Radio Playback',
    androidNotificationOngoing: true,
  );
  runApp(const RadioApp());
}

class RadioApp extends StatelessWidget {
  const RadioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio Agakiza',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RadioHomePage(),
    );
  }
}

class RadioHomePage extends StatefulWidget {
  const RadioHomePage({Key? key}) : super(key: key);

  @override
  State<RadioHomePage> createState() => _RadioHomePageState();
}

class _RadioHomePageState extends State<RadioHomePage> {
  final AudioPlayer _player = AudioPlayer();
  final String _streamUrl = 'https://cast6.asurahosting.com/proxy/radioaga/stream';
  String _status = 'Stopped';

  Future<void> _play() async {
    try {
      await _player.setUrl(_streamUrl);
      await _player.play();
      setState(() => _status = 'Playing');
    } catch (e) {
      setState(() => _status = 'Error: unable to play');
    }
  }

  Future<void> _pause() async {
    try {
      await _player.pause();
      setState(() => _status = 'Paused');
    } catch (_) {}
  }

  Future<void> _stop() async {
    try {
      await _player.stop();
      setState(() => _status = 'Stopped');
    } catch (_) {}
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Agakiza')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Status: \$_status'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _play, child: const Text('Play')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _pause, child: const Text('Pause')),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _stop, child: const Text('Stop')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

