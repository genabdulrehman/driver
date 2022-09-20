import 'package:drive_app/Presentation/View/Area/chooseArea.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'Presentation/View/Task-3/headOverlay.dart';

void main() {
  // await openHiveBox("AppDetails");
  // await readDetails();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drive App',
      theme: ThemeData(
        fontFamily: "Avenir Next",
        primarySwatch: Colors.blue,
      ),
      home: ChooseArea(),
    );
  }
}
