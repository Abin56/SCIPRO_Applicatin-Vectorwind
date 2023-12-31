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
    apiKey: 'AIzaSyAQE4bX4D7BDXlbLmkGH8ud-vZVugyqqzo',
    appId: '1:744404648297:web:ce408dc2c5342e239b7df8',
    messagingSenderId: '744404648297',
    projectId: 'scipro-vectorwind-97415',
    authDomain: 'scipro-vectorwind-97415.firebaseapp.com',
    storageBucket: 'scipro-vectorwind-97415.appspot.com',
    measurementId: 'G-R59M6G420S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-yvkPhq0Jx2WH8657S7n_efC13Oxhvbo',
    appId: '1:744404648297:android:20a5c320e7c8cb729b7df8',
    messagingSenderId: '744404648297',
    projectId: 'scipro-vectorwind-97415',
    storageBucket: 'scipro-vectorwind-97415.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCQWXHvsiNqrgg8noZcSrqaSHmVC_6Yh6Q',
    appId: '1:744404648297:ios:f9f2e23e94ba09ff9b7df8',
    messagingSenderId: '744404648297',
    projectId: 'scipro-vectorwind-97415',
    storageBucket: 'scipro-vectorwind-97415.appspot.com',
    iosClientId: '744404648297-ljhekqahrq8i5o55bvnj6cfsc0q3fst1.apps.googleusercontent.com',
    iosBundleId: 'com.example.sciproApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCQWXHvsiNqrgg8noZcSrqaSHmVC_6Yh6Q',
    appId: '1:744404648297:ios:3d4370d32b07938c9b7df8',
    messagingSenderId: '744404648297',
    projectId: 'scipro-vectorwind-97415',
    storageBucket: 'scipro-vectorwind-97415.appspot.com',
    iosClientId: '744404648297-a3po5dfj43l75odd8kovkrec9464491l.apps.googleusercontent.com',
    iosBundleId: 'com.example.sciproApplication.RunnerTests',
  );
}
