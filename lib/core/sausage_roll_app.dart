import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sausage_roll/core/app_locals.dart';
import 'package:sausage_roll/core/locator.dart';
import 'package:sausage_roll/features/bottom_navigation_page/presentation/bottom_navigation_page.dart';
import 'package:sausage_roll/features/cart/presentation/cart_page.dart';
import 'package:sausage_roll/generated/l10n.dart';

class SausageRollApp {
  static Future<void> appInit() async {
    setupLocators();
    run();
  }

  static void run() {
    return runApp(const GetMaterialApp(
        localizationsDelegates: [
          S.delegate,
        ],
        supportedLocales: AppSupportedLocals.appSupportedLocals,
        home: BottomNavigationPage()));
  }
}
