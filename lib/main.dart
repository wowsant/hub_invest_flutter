import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hub_invest_flutter/core/layout/main_scaffold.dart';
import 'package:hub_invest_flutter/core/menu/main.controller.dart';
import 'package:hub_invest_flutter/core/routes/app_routes.dart';
import 'package:hub_invest_flutter/home/home.binding.dart';
import 'package:hub_invest_flutter/home/home.view.dart';
import 'package:url_strategy/url_strategy.dart'; // Dependência url_strategy 0.3.0
import 'package:hub_invest_flutter/signup/signup.binding.dart';
import 'package:hub_invest_flutter/signup/signup.view.dart';
import 'login/login.binding.dart';
import 'login/login.view.dart';

void main() {
  // Remove o # da URL no Flutter Web
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HubInvest',
      initialBinding: MainBinding(),
      initialRoute: Routes.login,


      getPages: [

        GetPage(
          name: '/login',
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignupView(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: Routes.home,
          binding: HomeBinding(),
          page: () => const MainScaffold(body: HomeView()),
        ),

      ],






/*
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryDark, primary: primaryDark),
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF3F4F6),
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder.copyWith(
            borderSide: const BorderSide(color: primaryDark, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryDark,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: Color(0xFFE5E7EB)),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black87,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryDark),
        ),
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/signup',
          page: () => const SignupView(),
          binding: SignupBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],

      */
    );
  }
}
