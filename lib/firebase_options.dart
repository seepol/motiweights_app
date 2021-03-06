// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFiYEmUUAb_iMvKBMe4DK8RKIH1M33Gxw',
    appId: '1:834863370711:android:cc8bc9f09786a31ae07b92',
    messagingSenderId: '834863370711',
    projectId: 'motiweights-291b4',
    storageBucket: 'motiweights-291b4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWjbZM2gUnt6gm8gqAO60rs5IeZB4zpsk',
    appId: '1:834863370711:ios:45a9e356f33ecc03e07b92',
    messagingSenderId: '834863370711',
    projectId: 'motiweights-291b4',
    storageBucket: 'motiweights-291b4.appspot.com',
    androidClientId: '834863370711-tnu3qo6eh4nu7gf1gk7sfetm3f00tt39.apps.googleusercontent.com',
    iosClientId: '834863370711-8ummunnkhtd1ah1nuuii9fndruoskb50.apps.googleusercontent.com',
    iosBundleId: 'com.motiweights.motiweights',
  );
}
