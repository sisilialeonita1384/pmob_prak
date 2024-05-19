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
    apiKey: 'AIzaSyBhRayLUZCp1Un0cm6chMyQomDed7VNKIo',
    appId: '1:383516245637:web:deae4e6b81d63baf6873ec',
    messagingSenderId: '383516245637',
    projectId: 'education-app-master-52480',
    authDomain: 'education-app-master-52480.firebaseapp.com',
    storageBucket: 'education-app-master-52480.appspot.com',
    measurementId: 'G-Q9R5QNWH85',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiDuNsvaCtI83H4qtPTD8z32Kl1y-CR7U',
    appId: '1:383516245637:android:f73631b39033731d6873ec',
    messagingSenderId: '383516245637',
    projectId: 'education-app-master-52480',
    storageBucket: 'education-app-master-52480.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArX8z1mfwYQpExHmrzh4IeGMGsuCGsFcA',
    appId: '1:383516245637:ios:ce86e56b2f9ec4316873ec',
    messagingSenderId: '383516245637',
    projectId: 'education-app-master-52480',
    storageBucket: 'education-app-master-52480.appspot.com',
    iosBundleId: 'com.example.educationApp',
  );
}
