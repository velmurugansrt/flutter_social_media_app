import 'package:flutter/material.dart';
import 'package:flutter_social_media_app/src/ui/screen/main_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}
