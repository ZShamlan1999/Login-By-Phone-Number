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
    apiKey: 'AIzaSyCOSdAh588dXIhYZ9y-EVYB-PGWWyOXTM4',
    appId: '1:388466167622:web:5fcbe5adfdc8ecc6fb5f47',
    messagingSenderId: '388466167622',
    projectId: 'flutter-maps-phonenumber',
    authDomain: 'flutter-maps-phonenumber.firebaseapp.com',
    storageBucket: 'flutter-maps-phonenumber.appspot.com',
    measurementId: 'G-7TWL3NZL5S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBHR0a2bggy9-bCAmAh19mI4JlvFbcFkB0',
    appId: '1:388466167622:android:6cf4d7ac338aa97ffb5f47',
    messagingSenderId: '388466167622',
    projectId: 'flutter-maps-phonenumber',
    storageBucket: 'flutter-maps-phonenumber.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIil-5a8SgxAEVLksGmVcEM6kvtLI3brQ',
    appId: '1:388466167622:ios:051b0780a4a98a55fb5f47',
    messagingSenderId: '388466167622',
    projectId: 'flutter-maps-phonenumber',
    storageBucket: 'flutter-maps-phonenumber.appspot.com',
    iosBundleId: 'com.example.phoneAndGoogleMaps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIil-5a8SgxAEVLksGmVcEM6kvtLI3brQ',
    appId: '1:388466167622:ios:3c8da96360e49324fb5f47',
    messagingSenderId: '388466167622',
    projectId: 'flutter-maps-phonenumber',
    storageBucket: 'flutter-maps-phonenumber.appspot.com',
    iosBundleId: 'com.example.phoneAndGoogleMaps.RunnerTests',
  );
}