
// ignore_for_file: use_super_parameters, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zigzag/firebase_options.dart';
import 'splase_screen.dart';
import 'config/language_String.dart';
import 'config/light_and_dark.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (context) => ColorNotifier(),),
      ],
      child:  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('en', 'English'),

      //   translations: AppTranslationsapp(),
      // locale: const Locale('en', 'US'),



      theme: ThemeData(
        useMaterial3: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        dividerColor: Colors.transparent,
        fontFamily: 'SofiaProLight',
      ),
      // home: Scaffold(backgroundColor: Colors.grey),
      home: const Splase_Screen(),
      // home: Login_Screen(),
      // home: Forgot_With_Number(),

      // home: Forgot_With_Number(),
      // home: Home_Screen(),
      // home: Bottom_Navigation(),
    ),);
  }
}



class AppTranslationsapp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'enter_mail': 'Enter your email',
    },
    'ur_PK': {
      'enter_mail': 'اپنا ای میل درج کریں۔',
    }
  };
}
