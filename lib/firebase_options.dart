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
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCdGNBSAwDwzmbiXm22ucNNYDp3xrhuKXk',
    appId: '1:723908145827:web:31a81104521f9c64858516',
    messagingSenderId: '723908145827',
    projectId: 'surprise-alarms',
    authDomain: 'surprise-alarms.firebaseapp.com',
    storageBucket: 'surprise-alarms.appspot.com',
    measurementId: 'G-H8NLF3FN96',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDxF0D3yOFYk9oNvbUXJESH7y9gBexS34',
    appId: '1:723908145827:android:b89c783ca0d2508b858516',
    messagingSenderId: '723908145827',
    projectId: 'surprise-alarms',
    storageBucket: 'surprise-alarms.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrdrwnoQPDE2-cj7Ae8H3zWzE1vgTCdSU',
    appId: '1:723908145827:ios:e68fd14a9676d575858516',
    messagingSenderId: '723908145827',
    projectId: 'surprise-alarms',
    storageBucket: 'surprise-alarms.appspot.com',
    iosBundleId: 'com.example.surpriseAlarms',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBrdrwnoQPDE2-cj7Ae8H3zWzE1vgTCdSU',
    appId: '1:723908145827:ios:292ca5be5b255a1d858516',
    messagingSenderId: '723908145827',
    projectId: 'surprise-alarms',
    storageBucket: 'surprise-alarms.appspot.com',
    iosBundleId: 'com.example.surpriseAlarms.RunnerTests',
  );
}
