

import 'package:billing/provider/cal_provider.dart';
import 'package:billing/provider/keyboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'email_auth/splash_screen.dart';
import 'firebase_options.dart';
import 'languages/marathi/homepage/app_translations.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => KeyboardVisibilityNotifier()),
        ChangeNotifierProvider(create: (context) => CalculatorProvider()), // Add your CalculatorProvider here
      ],
      child: GetMaterialApp(
        translations: AppTranslations(),
        locale: Locale('mr', 'IN'),
        fallbackLocale: Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        // supportedLocales: const [
        //   Locale('en', 'US'),
        //   Locale('mr', 'IN'),
        // ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:SplashScreen(), // Change this to your desired starting screen
      ),
    );
  }
}