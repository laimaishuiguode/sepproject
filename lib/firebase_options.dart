import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDg6XdbjYxgEMvN2-DKHUL31FZuSuzTGps',
    appId: '1:236155298310:web:c4f2bf3e2239f34e761987',
    messagingSenderId: '236155298310',
    projectId: 'kalam-3c4c9',
    authDomain: 'kalam-3c4c9.firebaseapp.com',
    storageBucket: 'kalam-3c4c9.firebasestorage.app',
    measurementId: 'G-KDNJDNQGT4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1XQgTI7Ode9xQhsIhjoFZST_Ix4DobM0',
    appId: '1:236155298310:android:9c7169f717c44d46761987',
    messagingSenderId: '236155298310',
    projectId: 'kalam-3c4c9',
    storageBucket: 'kalam-3c4c9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAltHMKnpT1LiEUwevYaT_JR1VltZJPyk',
    appId: '1:236155298310:ios:a58da7587d23cc6c761987',
    messagingSenderId: '236155298310',
    projectId: 'kalam-3c4c9',
    storageBucket: 'kalam-3c4c9.firebasestorage.app',
    iosBundleId: 'com.example.kalam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAltHMKnpT1LiEUwevYaT_JR1VltZJPyk',
    appId: '1:236155298310:ios:a58da7587d23cc6c761987',
    messagingSenderId: '236155298310',
    projectId: 'kalam-3c4c9',
    storageBucket: 'kalam-3c4c9.firebasestorage.app',
    iosBundleId: 'com.example.kalam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDg6XdbjYxgEMvN2-DKHUL31FZuSuzTGps',
    appId: '1:236155298310:web:d106a6dfea524c3a761987',
    messagingSenderId: '236155298310',
    projectId: 'kalam-3c4c9',
    authDomain: 'kalam-3c4c9.firebaseapp.com',
    storageBucket: 'kalam-3c4c9.firebasestorage.app',
    measurementId: 'G-XD5QCGDWCT',
  );

  static const FirebaseOptions currentPlatform = web;
}