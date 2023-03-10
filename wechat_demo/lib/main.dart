import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/pvc_root_page.dart';
import 'package:wechat_demo/pages/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const RootPage(),
      home: const PVCRootPage(),
    );
  }
}
