// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCsCdmS8UxUrEaEe43JV4CgR8B5RQvUjiw',
    appId: '1:821523126812:web:40aabf875b006182465dd9',
    messagingSenderId: '821523126812',
    projectId: 'ramyiti',
    authDomain: 'ramyiti.firebaseapp.com',
    storageBucket: 'ramyiti.appspot.com',
    measurementId: 'G-SH43QEE3LX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsm32OIbq2kwurWGVCGtRLMhWZgAgTZjg',
    appId: '1:821523126812:android:1682d88be5c7d520465dd9',
    messagingSenderId: '821523126812',
    projectId: 'ramyiti',
    storageBucket: 'ramyiti.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWC9hcyxfzzWo5ivrNqnPt9Jfx2oxM_RI',
    appId: '1:821523126812:ios:b1b23d7d7b2a03f7465dd9',
    messagingSenderId: '821523126812',
    projectId: 'ramyiti',
    storageBucket: 'ramyiti.appspot.com',
    iosBundleId: 'com.example.iti',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAWC9hcyxfzzWo5ivrNqnPt9Jfx2oxM_RI',
    appId: '1:821523126812:ios:b1b23d7d7b2a03f7465dd9',
    messagingSenderId: '821523126812',
    projectId: 'ramyiti',
    storageBucket: 'ramyiti.appspot.com',
    iosBundleId: 'com.example.iti',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCsCdmS8UxUrEaEe43JV4CgR8B5RQvUjiw',
    appId: '1:821523126812:web:a044189401a47c05465dd9',
    messagingSenderId: '821523126812',
    projectId: 'ramyiti',
    authDomain: 'ramyiti.firebaseapp.com',
    storageBucket: 'ramyiti.appspot.com',
    measurementId: 'G-05E5EK9EQS',
  );
}
