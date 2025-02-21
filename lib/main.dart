import 'dart:io';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/payment/services/api_keys.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/provider/favorites_provider.dart';
import 'package:ecommerce_app/views/logo_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    if (Platform.isAndroid) {
      return super.createHttpClient(context)
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
    }

    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY 192.168.1.7:8083";
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = ApiKeys.Publishablekey;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const EcommerceApp(),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogoView(),
    );
  }
}
