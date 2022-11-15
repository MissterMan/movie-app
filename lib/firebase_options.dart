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
    apiKey: 'AIzaSyDo0qyrVju2KGfCiVJDyRG4tu0Lv7T9Zq0',
    appId: '1:816309988921:web:d60c42e068e183bf6ea7e8',
    messagingSenderId: '816309988921',
    projectId: 'ditonton-2ba58',
    authDomain: 'ditonton-2ba58.firebaseapp.com',
    storageBucket: 'ditonton-2ba58.appspot.com',
    measurementId: 'G-DBPG0R03G0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBE-PbF2PqzpCH8bPwoU2sZy85jfXUqGUs',
    appId: '1:816309988921:android:1575e18c65c0e6a36ea7e8',
    messagingSenderId: '816309988921',
    projectId: 'ditonton-2ba58',
    storageBucket: 'ditonton-2ba58.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwJ7kv58p1-JgT9xIqbKeLu4ctcaHyOOQ',
    appId: '1:816309988921:ios:c96be7d9e708cfa56ea7e8',
    messagingSenderId: '816309988921',
    projectId: 'ditonton-2ba58',
    storageBucket: 'ditonton-2ba58.appspot.com',
    iosClientId: '816309988921-eninjbbclnubc0o3utecq6aj9gcfc022.apps.googleusercontent.com',
    iosBundleId: 'com.dicoding.ditonton',
  );
}
