# Radio Agakiza

This repository contains a minimal Flutter application for streaming the Radio Agakiza online station. The app uses [`just_audio`](https://pub.dev/packages/just_audio) and [`just_audio_background`](https://pub.dev/packages/just_audio_background) to provide background playback with simple play, pause and stop controls.

## Features
- Streams audio from `https://cast6.asurahosting.com/proxy/radioaga/stream`.
- Play, pause and stop controls.
- Continues playing in the background while using other apps or when the screen is off.
- Basic error handling and a display of the current playback status.

## Running
1. Ensure you have Flutter installed.
2. Run `flutter pub get` to fetch dependencies.
3. Use `flutter run` to launch the application on your device or emulator.

The `AndroidManifest.xml` already includes the necessary permissions for internet access and foreground service usage.
