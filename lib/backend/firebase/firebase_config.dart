import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAI7sDrh7-i-6quu5ctpPpoyiLRJO7-enk",
            authDomain: "serei-a1634.firebaseapp.com",
            projectId: "serei-a1634",
            storageBucket: "serei-a1634.appspot.com",
            messagingSenderId: "896297517998",
            appId: "1:896297517998:web:fc809ef080a1d052307e3f",
            measurementId: "G-BCXFJFH57G"));
  } else {
    await Firebase.initializeApp();
  }
}
