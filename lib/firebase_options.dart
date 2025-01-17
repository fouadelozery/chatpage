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
    apiKey: 'AIzaSyCcdCKCCOA4NiyJdy8Bqqc7-v5T4YUlw78',
    appId: '1:701887932067:web:a9d1ab38653355e2410116',
    messagingSenderId: '701887932067',
    projectId: 'chat-app-project-c2640',
    authDomain: 'chat-app-project-c2640.firebaseapp.com',
    storageBucket: 'chat-app-project-c2640.firebasestorage.app',
    measurementId: 'G-9TF1K8BN9P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6y8Mgd0jdbsP6kULgaPelxXAn7e2OoAI',
    appId: '1:701887932067:android:e5315e7f995090aa410116',
    messagingSenderId: '701887932067',
    projectId: 'chat-app-project-c2640',
    storageBucket: 'chat-app-project-c2640.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_rNDlUNGqw6UQ0t3GpQ0MrYLttlFAsM8',
    appId: '1:701887932067:ios:5d4a129be9fea319410116',
    messagingSenderId: '701887932067',
    projectId: 'chat-app-project-c2640',
    storageBucket: 'chat-app-project-c2640.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication8',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_rNDlUNGqw6UQ0t3GpQ0MrYLttlFAsM8',
    appId: '1:701887932067:ios:5d4a129be9fea319410116',
    messagingSenderId: '701887932067',
    projectId: 'chat-app-project-c2640',
    storageBucket: 'chat-app-project-c2640.firebasestorage.app',
    iosBundleId: 'com.example.flutterApplication8',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcdCKCCOA4NiyJdy8Bqqc7-v5T4YUlw78',
    appId: '1:701887932067:web:791c2277d325a3d3410116',
    messagingSenderId: '701887932067',
    projectId: 'chat-app-project-c2640',
    authDomain: 'chat-app-project-c2640.firebaseapp.com',
    storageBucket: 'chat-app-project-c2640.firebasestorage.app',
    measurementId: 'G-NY0EBS5KZK',
  );
}
