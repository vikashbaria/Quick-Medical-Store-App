import 'package:flutter/material.dart';
import 'package:medical_store_mobile_app/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Overpass'),
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      //home: ProductDetailScreen(product: product),
    );
  }
}
