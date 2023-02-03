// @dart=2.9
import 'package:flutter/material.dart';
import 'package:ins/screens/WelcomScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:ins/screens/HomeScreen.dart';
import 'package:ins/screens/ViewPostScreen.dart';
import 'package:ins/screens/ChatScreen.dart';
import 'package:ins/screens/ChatDetailScreen.dart';
import 'package:ins/screens/ProfileScreen.dart';
import 'package:ins/screens/HomeScreen.dart';
// import 'package:flutter_html/flutter_html.dart';

void main() => runApp(
      DevicePreview(
        // enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: HomeScreen(),
      home: WelcomScreen(),
      // home: ChatScreen(),
      // home: ChatDetailScreen(),
      // home: ProfileScreen(),
    );
  }
}
