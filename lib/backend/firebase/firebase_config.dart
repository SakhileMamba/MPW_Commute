import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAqMpvumo1SHrdsD9moyulPYRxC5O58XCg",
            authDomain: "mpw-commute.firebaseapp.com",
            projectId: "mpw-commute",
            storageBucket: "mpw-commute.appspot.com",
            messagingSenderId: "549233771637",
            appId: "1:549233771637:web:54fb27a5e59ee12db4e43c",
            measurementId: "G-8K90LG1QCW"));
  } else {
    await Firebase.initializeApp();
  }
}
