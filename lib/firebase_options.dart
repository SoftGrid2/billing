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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD7u3hgzaN11Zu9wQ5ykBlZsbGBcSYpGQA',
    appId: '1:733558653831:web:18ad614993144591c90922',
    messagingSenderId: '733558653831',
    projectId: 'sgibook',
    authDomain: 'sgibook.firebaseapp.com',
    storageBucket: 'sgibook.firebasestorage.app',
    measurementId: 'G-W0YV9ZSRTF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCNp7CuBCKj8CbDiMw6f6MqZxxi__OMAc',
    appId: '1:733558653831:android:5d64b401afef946cc90922',
    messagingSenderId: '733558653831',
    projectId: 'sgibook',
    storageBucket: 'sgibook.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7u3hgzaN11Zu9wQ5ykBlZsbGBcSYpGQA',
    appId: '1:733558653831:web:7136517e58f6cb61c90922',
    messagingSenderId: '733558653831',
    projectId: 'sgibook',
    authDomain: 'sgibook.firebaseapp.com',
    storageBucket: 'sgibook.firebasestorage.app',
    measurementId: 'G-753MD8LNYC',
  );

}