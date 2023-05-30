// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions? get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        // throw UnsupportedError(
        //   'DefaultFirebaseOptions have not been configured for macos - '
        //   'you can reconfigure this by running the FlutterFire CLI again.',
        // );
        return null;
      case TargetPlatform.windows:
        // throw UnsupportedError(
        //   'DefaultFirebaseOptions have not been configured for windows - '
        //   'you can reconfigure this by running the FlutterFire CLI again.',
        // );
        return null;
      case TargetPlatform.linux:
        // throw UnsupportedError(
        //   'DefaultFirebaseOptions have not been configured for linux - '
        //   'you can reconfigure this by running the FlutterFire CLI again.',
        // );
        return null;
      default:
        // throw UnsupportedError(
        //   'DefaultFirebaseOptions are not supported for this platform.',
        // );
        return null;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAkgJ7mXeWC4H53DjEit8_y0ue3Xdwbqtc',
    appId: '1:440610800698:web:c0392f04bc54e5d4256103',
    messagingSenderId: '440610800698',
    projectId: 'englishocr-2829d',
    authDomain: 'englishocr-2829d.firebaseapp.com',
    databaseURL: 'https://englishocr-2829d.firebaseio.com',
    storageBucket: 'englishocr-2829d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoMFeBSigwyPgTKTLnO5SVE8Li7QGrPBk',
    appId: '1:440610800698:android:5ca8df4ceed69827256103',
    messagingSenderId: '440610800698',
    projectId: 'englishocr-2829d',
    databaseURL: 'https://englishocr-2829d.firebaseio.com',
    storageBucket: 'englishocr-2829d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCR5-fuQmqk2KCw7mS5Yzee7noVR2jzrLQ',
    appId: '1:440610800698:ios:c7af9858a4c692a9256103',
    messagingSenderId: '440610800698',
    projectId: 'englishocr-2829d',
    databaseURL: 'https://englishocr-2829d.firebaseio.com',
    storageBucket: 'englishocr-2829d.appspot.com',
    iosClientId: '440610800698-57ig23ls4eg53vhb5s324bki3d2ah82s.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterStarter',
  );
}