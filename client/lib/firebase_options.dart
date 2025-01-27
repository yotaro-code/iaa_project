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
    apiKey: 'AIzaSyCINWUuIdT1B0SEGekZv-rJj35CHENFrZ4',
    appId: '1:63162381056:web:e6c271775f4cd264fb79e5',
    messagingSenderId: '63162381056',
    projectId: 'carbon-crossing-446001-p7',
    authDomain: 'carbon-crossing-446001-p7.firebaseapp.com',
    storageBucket: 'carbon-crossing-446001-p7.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwfwgoLVarTTYuK7zzrYo3kV3mb_K_E_U',
    appId: '1:63162381056:android:eb6e792124fb0edcfb79e5',
    messagingSenderId: '63162381056',
    projectId: 'carbon-crossing-446001-p7',
    storageBucket: 'carbon-crossing-446001-p7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-0iadThMGv5aO2tg13cVRh473TIj2q6c',
    appId: '1:63162381056:ios:3642296d85f81a1bfb79e5',
    messagingSenderId: '63162381056',
    projectId: 'carbon-crossing-446001-p7',
    storageBucket: 'carbon-crossing-446001-p7.firebasestorage.app',
    iosBundleId: 'com.example.interviewAgentsAi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-0iadThMGv5aO2tg13cVRh473TIj2q6c',
    appId: '1:63162381056:ios:3642296d85f81a1bfb79e5',
    messagingSenderId: '63162381056',
    projectId: 'carbon-crossing-446001-p7',
    storageBucket: 'carbon-crossing-446001-p7.firebasestorage.app',
    iosBundleId: 'com.example.interviewAgentsAi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCINWUuIdT1B0SEGekZv-rJj35CHENFrZ4',
    appId: '1:63162381056:web:9742f87ed9fed403fb79e5',
    messagingSenderId: '63162381056',
    projectId: 'carbon-crossing-446001-p7',
    authDomain: 'carbon-crossing-446001-p7.firebaseapp.com',
    storageBucket: 'carbon-crossing-446001-p7.firebasestorage.app',
  );

}