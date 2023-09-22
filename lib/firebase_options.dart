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
    apiKey: 'AIzaSyA3jLTMUe5Sf79YVRUXVI9O5l2HhkazYU4',
    appId: '1:664932780255:web:1b8c9ac2b4f7128fc8c16a',
    messagingSenderId: '664932780255',
    projectId: 'orderit-67872',
    authDomain: 'orderit-67872.firebaseapp.com',
    storageBucket: 'orderit-67872.appspot.com',
    measurementId: 'G-GYP0B6WPVD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB44KBpsbzq7p8WwK_nJNqwrXCPV_3zSbo',
    appId: '1:664932780255:android:5c87876b134a7722c8c16a',
    messagingSenderId: '664932780255',
    projectId: 'orderit-67872',
    storageBucket: 'orderit-67872.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-kpcUHPzgyjOakE_lLWp937Sp_v2kgzw',
    appId: '1:664932780255:ios:47818988e0329c52c8c16a',
    messagingSenderId: '664932780255',
    projectId: 'orderit-67872',
    storageBucket: 'orderit-67872.appspot.com',
    iosBundleId: 'com.example.orderIt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-kpcUHPzgyjOakE_lLWp937Sp_v2kgzw',
    appId: '1:664932780255:ios:47818988e0329c52c8c16a',
    messagingSenderId: '664932780255',
    projectId: 'orderit-67872',
    storageBucket: 'orderit-67872.appspot.com',
    iosBundleId: 'com.example.orderIt',
  );
}
