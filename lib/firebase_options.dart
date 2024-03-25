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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA_IIDy8TaKI2Z_rfwSUWT6FUDbiGWvAsw',
    appId: '1:738217171773:web:1cd37e42ab291c31fb0354',
    messagingSenderId: '738217171773',
    projectId: 'todoapp-25aaa',
    authDomain: 'todoapp-25aaa.firebaseapp.com',
    storageBucket: 'todoapp-25aaa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHhNmTsWs1d8Ye80EN8UfOPMCKSVpHWHY',
    appId: '1:738217171773:android:927d76a23539b417fb0354',
    messagingSenderId: '738217171773',
    projectId: 'todoapp-25aaa',
    storageBucket: 'todoapp-25aaa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJ41Hb90ZZ9HyVzY1__Aizkvh3AmXQQd0',
    appId: '1:738217171773:ios:5010a7010e9deff1fb0354',
    messagingSenderId: '738217171773',
    projectId: 'todoapp-25aaa',
    storageBucket: 'todoapp-25aaa.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );
}
